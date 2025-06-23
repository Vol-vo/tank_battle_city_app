import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tank_battle_city/features/game_screen/models/map/map.dart';
import 'package:tank_battle_city/features/game_screen/models/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game_screen/models/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/concrete.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/earth.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/forest.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/half_ruined_wall.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/ice.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/ruined_wall.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/water.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_components/whole_brick_wall.dart';

class GameScreenPresenter {
  GameMap map = GameMap(size: 12);

  int get sizeMap => map.size;

  BehaviorSubject<bool> get mapIsGenerated => map.mapIsGenerated;

  Future<void> init () async {
    map.init();
  }

  MapBlock getBlock (int x, int y) => map.getBlock(x, y);

  MapItemsType getBlockType (int x, int y) => map.getBlockType(x, y);

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
      // default: return ColoredBox(color: Colors.white,child: SizedBox(height: sizeMap.toDouble(), width: sizeMap.toDouble(),));
    }
  }

  Widget getBlockWidgetFromPosition (int x, int y) {
    final type = getBlockType(x, y);
    return getBlockWidget(type);
  }

}