import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/position.dart';
import 'package:tank_battle_city/features/game_screen/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/tank.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/tank_bot/tank_bot.dart';
import 'package:tank_battle_city/features/game_screen/models/game/turn_state.dart';

class Game {
  Game(this.settings) {
    init();
  }

  final GameSettings settings;
  late GameMap map;

  List<TurnState> turns = [];
  BehaviorSubject<int> countTurns = BehaviorSubject.seeded(0);

  TurnState get lastTurn => turns.last;
  List<Tank> get tanks => lastTurn.tanks;
  int get mapSize => map.size;

  MapBlock getBlock(int x, int y) => map.getBlock(x, y);

  MapItemsType getBlockType(int x, int y) => map.getBlockType(x, y);

  Future<void> init() async {
    map = GameMap(size: settings.mapSize);
    final tanks = List.generate(settings.countBots, (index) => _generateTank()).toList();
    turns.add(TurnState(tanks: tanks, map: map));
    countTurns = BehaviorSubject.seeded(turns.length);
  }

  void dispose() {
    map.dispose();
    countTurns.close();
  }

  Tank _generateTank() {
    late Position pos;
    while (true) {
      pos = Position(Random().nextInt(map.size), Random().nextInt(map.size));
      if (map.getBlockType(pos.x, pos.y) == MapItemsType.earth) break;
    }

    final direction = Direction.values[Random().nextInt(4)];
    return DefaultTankBot(position: pos, direction: direction, map: map);
  }

  void nextTurn() {
    List<Tank> newTanks = [];
    for (final tank in tanks) {
      final newTank = tank.copyWith()
      ..move(tanks);
      newTanks.add(newTank);
    }

    _fireAllTanks();

    turns.add(TurnState(tanks: newTanks, map: map));
    countTurns.add(turns.length);
  }

  void _fireAllTanks() {
    for (final tank in tanks) {
      switch (tank.direction) {
        case Direction.north:
          for (int i = tank.position.y - 1; i >= 0; i--) {
            if (map.blockIsInterfereForFire(tank.position.x, i) || _isHitTheTank(tank.position.x, i, tank.attach)) {
              break;
            }
          }
          break;
        case Direction.south:
          for (int i = tank.position.y + 1; i < mapSize; i++) {
            if (map.blockIsInterfereForFire(tank.position.x, i) || _isHitTheTank(tank.position.x, i, tank.attach)) {
              break;
            }
          }
          break;
        case Direction.west:
          for (int i = tank.position.x - 1; i >= 0; i--) {
            if (map.blockIsInterfereForFire(i, tank.position.y) || _isHitTheTank(i, tank.position.y, tank.attach)) {
              break;
            }
          }
          break;
        case Direction.east:
          for (int i = tank.position.x + 1; i < mapSize; i++) {
            if (map.blockIsInterfereForFire(i, tank.position.y) || _isHitTheTank(i, tank.position.y, tank.attach)) {
              break;
            }
          }
          break;
      }
    }
  }

  bool _isHitTheTank(int x, int y, int hit) {
    for (final tank in tanks) {
      if (tank.position.x == x && tank.position.y == y){
        tank.healthPoint =- hit;
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
      if (tank.position == Position(x, y)) return true;
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
