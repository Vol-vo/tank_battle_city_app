import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:tank_battle_city/features/game_screen/models/game/game.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/direction.dart';

class GameScreenPresenter {

  Game game = Game(GameSettings(mapSize: 12, countBots: 4, countPlayer: 0));

  int get mapSize => game.mapSize;

  BehaviorSubject<int> get countTurns => game.countTurns;

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
  }

  void previousTurn() {
    game.previousTurn();
  }

}