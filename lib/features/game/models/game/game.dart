import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:tank_battle_city/features/game/models/game/map/map.dart';
import 'package:tank_battle_city/features/game/models/game/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game/models/game/map/position.dart';
import 'package:tank_battle_city/features/game/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tank_bot/tank_names.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tanks.dart';
import 'package:tank_battle_city/features/game/models/game/turn_state.dart';
import 'package:tank_battle_city/features/game/models/game/turn_status.dart';

class Game {
  Game(this.settings) {
    init();
  }

  final GameSettings settings;
  late GameMap map;

  List<TurnState> turns = [];
  BehaviorSubject<int> countTurns = BehaviorSubject.seeded(0);
  BehaviorSubject<TurnStatus> turnStatus = BehaviorSubject.seeded(TurnStatus.none);

  TurnState get lastTurn => turns.last;

  List<Tank> get tanks => lastTurn.tanks;

  int get mapSize => map.size;

  MapBlock getBlock(int x, int y) => map.getBlock(x, y);

  MapItemsType getBlockType(int x, int y) => map.getBlockType(x, y);

  Future<void> init() async {
    map = GameMap(size: settings.mapSize);
    final tanks = _generateTanks(0, 0, settings.mapSize - 1, settings.mapSize - 1, settings.bots);
    turns.add(TurnState(tanks: tanks, map: map));
    countTurns = BehaviorSubject.seeded(turns.length);
  }

  void dispose() {
    map.dispose();
    countTurns.close();
    turnStatus.close();
  }

  List<Tank> _generateTanks(int x1, int y1, int x2, int y2, List<TankDifficulty> tankDifficulty) {
    final countTanks = tankDifficulty.length;

    if (countTanks <= 0) return [];
    if (countTanks == 1) return [_generateTankInBlock(x1, y1, x2, y2, tankDifficulty.first)];

    List<Tank> tanks = [];

    final width = x2 - x1;
    final height = y2 - y1;

    final tankDifficulty1 = tankDifficulty.sublist(0, countTanks ~/ 2);
    final tankDifficulty2 = tankDifficulty.sublist(countTanks ~/ 2);

    if (width > height) {
      final midX = x1 + width ~/ 2;

      tanks.addAll(_generateTanks(x1, y1, midX, y2, tankDifficulty1));
      tanks.addAll(_generateTanks(midX + 1, y1, x2, y2, tankDifficulty2));
    } else {
      final midY = y1 + height ~/ 2;

      tanks.addAll(_generateTanks(x1, y1, x2, midY, tankDifficulty1));
      tanks.addAll(_generateTanks(x1, midY + 1, x2, y2, tankDifficulty2));
    }

    return tanks;
  }

  Tank _generateTankInBlock(int x1, int y1, int x2, int y2, TankDifficulty tankDifficulty) {
    List<Position> earthPosition = [];
    for (int i = y1; i <= y2; i++) {
      for (int j = x1; j <= x2; j++) {
        if (getBlockType(j, i) == MapItemsType.earth) {
          earthPosition.add(Position(j, i));
        }
      }
    }

    final Position position = earthPosition[Random().nextInt(earthPosition.length)];
    final direction = Direction.values[Random().nextInt(Direction.values.length)];

    switch (tankDifficulty) {
      case TankDifficulty.ease:
        return Tank.easy(position: position, direction: direction, map: map, name: TankNames.getRandomName());
      case TankDifficulty.medium:
        return Tank.medium(position: position, direction: direction, map: map, name: TankNames.getRandomName());
    }
  }

  void nextTurn() async {
    turns.add(TurnState(tanks: tanks, map: map));

    for (var tank in tanks) {
      tank.firstMove(tanks);
      turnStatus.value = TurnStatus.firstMove;
    }
    await Future.delayed(Duration(seconds: 1));

    for (var tank in tanks) {
      tank.secondMove(tanks);
      turnStatus.value = TurnStatus.secondMove;
    }
    await Future.delayed(Duration(seconds: 1));

    for (var tank in tanks) {
      tank.thirdMove(tanks);
      turnStatus.value = TurnStatus.thirdMove;
    }
    await Future.delayed(Duration(seconds: 1));

    _fireAllTanks();
    turnStatus.value = TurnStatus.fire;

    tanks.removeWhere((tank) => tank.isNotAlive);

    countTurns.add(turns.length);
  }

  void _fireAllTanks() {
    for (final tank in tanks) {
      switch (tank.direction) {
        case Direction.south:
          for (int i = tank.position.x + 1; i < mapSize; i++) {
            if (map.blockIsInterfereForFire(i, tank.position.y) ||
                _isHitTheTank(i, tank.position.x, tank.attach, tanks)) {
              break;
            }
          }
          break;
        case Direction.north:
          for (int i = tank.position.x - 1; i >= 0; i--) {
            if (map.blockIsInterfereForFire(i, tank.position.y) ||
                _isHitTheTank(i, tank.position.x, tank.attach, tanks)) {
              break;
            }
          }
          break;
        case Direction.east:
          for (int i = tank.position.y + 1; i < mapSize; i++) {
            if (map.blockIsInterfereForFire(tank.position.x, i) ||
                _isHitTheTank(tank.position.y, i, tank.attach, tanks)) {
              break;
            }
          }
          break;
        case Direction.west:
          for (int i = tank.position.y - 1; i >= 0; i--) {
            if (map.blockIsInterfereForFire(tank.position.x, i) ||
                _isHitTheTank(tank.position.y, i, tank.attach, tanks)) {
              break;
            }
          }
          break;
      }
    }
  }

  bool _isHitTheTank(int x, int y, int hit, List<Tank> tanks) {
    for (final tank in tanks) {
      if (tank.position.x == x && tank.position.y == y) {
        tank.healthPoint -= hit;
        return true;
      }
    }
    return false;
  }

  void previousTurn() {
    if (turns.isEmpty || countTurns.value <= 1) return;

    turns.removeLast();
    countTurns.add(turns.length);
  }

  bool blockWithTank(int x, int y) {
    for (var tank in lastTurn.tanks) {
      if (tank.position == Position(x, y) && tank.isAlive) return true;
    }

    return false;
  }

  Tank? getTankFromPosition(int x, int y) {
    for (var tank in lastTurn.tanks) {
      if (tank.position == Position(x, y)) return tank;
    }

    return null;
  }
}
