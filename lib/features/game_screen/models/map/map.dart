import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:tank_battle_city/features/game_screen/models/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game_screen/models/map/positions.dart';
import 'package:tank_battle_city/features/game_screen/models/map/map_items_type.dart';

class GameMap {
  GameMap ({required this.size});

  List<List<MapBlock>> blocks = [];
  BehaviorSubject<bool> mapIsGenerated = BehaviorSubject.seeded(false);

  final int size;

  void init () async {
     _generateMap();
  }

  MapBlock getBlock (int x, int y) {
    return blocks[y][x];
  }

  MapItemsType getBlockType (int x, int y) {
    return getBlock(x, y).type;
  }


  Future<void> _generateMap() async {
    for (int y = 0; y < size; y++) {
      blocks.add([]);
      var row = blocks[y];
      for (int x = 0; x < size; x++) {
        row.add(_generateBlock(x, y));
      }
    }
    mapIsGenerated.add(true);
  }

  MapBlock _generateBlock(int x, int y) {


    return MapBlock(positions: Positions(x, y), type: _getRandomType());
  }

  MapItemsType _getRandomType() {
    int random = Random().nextInt(8);
    return MapItemsType.values[random];
  }
}