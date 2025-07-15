
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tank_battle_city/features/game_screen/models/game/game.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/concrete.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/earth.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/forest.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/half_ruined_wall.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/ice.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/ruined_wall.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/water.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/whole_brick_wall.dart';
import 'package:tank_battle_city/features/game_screen/view/components/tanks/default_tank_bot_widget.dart';

class GameScreenPresenter {

  Game game = Game(GameSettings(mapSize: 12, countBots: 3, countPlayer: 0));

  int get mapSize => gameSettings.mapSize;

  GameSettings get gameSettings => game.settings;

  BehaviorSubject<bool> get mapIsGenerated => game.mapIsGenerated;
  BehaviorSubject<int> get countTurns => game.countTurns;

  MapBlock getBlock (int x, int y) => game.getBlock(x, y);

  MapItemsType getBlockType (int x, int y) => game.getBlockType(x, y);

  Widget getBlockWidget (MapItemsType type) {
    switch (type) {
      case MapItemsType.water: return Water();
      case MapItemsType.earth: return Earth();
      case MapItemsType.concrete: return Concrete();
      case MapItemsType.forest: return Forest();
      case MapItemsType.halfRuinedWall: return HalfRuinedWall();
      case MapItemsType.ice: return Ice();
      case MapItemsType.ruinedWall: return RuinedWall();
      case MapItemsType.wholeBrickWall: return WholeBrickWall();
    }
  }

  Widget getBlockWidgetFromPosition (int x, int y) {
    final type = getBlockType(x, y);
    var mapWidget = getBlockWidget(type);

    if (game.blockWithTank(x, y)){
      mapWidget = Stack(
        children: [mapWidget, Center(
            child: DefaultTankBotWidget(direction: game.getTankFromPosition(x, y)!.direction))],
      );
    }


    return mapWidget;
  }

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