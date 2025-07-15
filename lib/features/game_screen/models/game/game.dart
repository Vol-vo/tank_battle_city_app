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
  late BehaviorSubject<int> countTurns;

  TurnState get lastTurn => turns.last;
  List<Tank> get tanks => lastTurn.tanks;
  BehaviorSubject<bool> get mapIsGenerated => map.mapIsGenerated;

  MapBlock getBlock(int x, int y) => map.getBlock(x, y);

  MapItemsType getBlockType(int x, int y) => map.getBlockType(x, y);

  void init() {
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
    var pos = Position(0, 0);
    while (true) {
      pos = Position(Random().nextInt(map.size), Random().nextInt(map.size));
      if (map.getBlockType(pos.x, pos.y) == MapItemsType.earth) break;
    }

    final direction = Direction.values[Random().nextInt(4)];
    return DefaultTankBot(position: pos, direction: direction, map: map);
  }

  void nextTurn() {
    List<Tank> newTank = [];
    for (final tank in tanks) {
      newTank.add(tank.copyWith(position: tank.move(tanks)));
    }

    turns.add(TurnState(tanks: newTank, map: map));
    countTurns.add(turns.length);
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
