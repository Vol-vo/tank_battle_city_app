import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tank_battle_city/features/game/models/game/game.dart';
import 'package:tank_battle_city/features/game/models/game/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tanks.dart';
import 'package:tank_battle_city/features/game/models/game/turn_status.dart';

class GameScreenViewModel with ChangeNotifier {

  GameScreenViewModel({required this.gameSettings}) {
    init();
  }

  final GameSettings gameSettings;

  late Game game;

  int get mapSize => game.mapSize;

  int get countTurns => game.countTurns.value;
  Stream<TurnStatus> get turnStatusStream => game.turnStatus.stream;

  void init() {
    game = Game(gameSettings);
    turnStatusStream.listen((event) {
      notifyListeners();
    });
  }

  MapBlock getBlock (int x, int y) => game.getBlock(x, y);

  MapItemsType getBlockType (int x, int y) => game.getBlockType(x, y);

  double getAngleFromDirection(Direction direction) {
    switch (direction) {
      case Direction.north:
        return 0;
      case Direction.south:
        return pi;
      case Direction.west:
        return -pi / 2;
      case Direction.east:
        return pi / 2;
    }
  }

  void nextTurn() {
    game.nextTurn();
    notifyListeners();
  }

  void previousTurn() {
    game.previousTurn();
    notifyListeners();
  }

  bool blockWithTank(x, y) {
    return game.blockWithTank(x, y);
  }

  Tank? getTankFromPosition(x, y) {
    return game.getTankFromPosition(x, y);
  }

  Direction? getTankDirection(x, y) {
    return getTankFromPosition(x, y)!.direction;
  }

}