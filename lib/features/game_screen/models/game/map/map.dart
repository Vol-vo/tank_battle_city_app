import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/position.dart';

class GameMap {
  GameMap ({required this.size}){
    init();
  }

  List<List<MapBlock>> blocks = [];
  BehaviorSubject<bool> mapIsGenerated = BehaviorSubject.seeded(false);

  final int size;

  void init () async {
     _generateMap();
  }

  void dispose() {
    mapIsGenerated.close();
  }

  MapBlock getBlock (int x, int y) {
    return blocks[y][x];
  }

  MapItemsType getBlockType (int x, int y) {
    return getBlock(x, y).type;
  }

  MapItemsType? getBlockTypeOrNull (int x, int y) {
    if (x < 0 || x >= size || y < 0 || y >= size) return null;
    return getBlockType(x, y);
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
    Map<MapItemsType, int> environment = _getEnvironment(x, y);
    var block = MapBlock(positions: Position(x, y), type: _getRandomType());

    if (!environment.containsKey(block.type) || environment[block.type]! < 3) {
      return block;
    }

    block = MapBlock(positions: Position(x, y), type: MapItemsType.earth);
    return block;
  }

  Map<MapItemsType, int> _getEnvironment (int x, int y) {
    Map<MapItemsType, int> environment = {};

    for (int y = -1; y <= 0; y++){
      for (int x = -1; x <= 1; x++){
        if (y == 0 && x >= 0) continue;
          final block = getBlockTypeOrNull(x, y);
          if (block == null) continue;
          if (environment.containsKey(block)) {
            environment.update(block, (count) => count++);
          } else {
            environment.addAll({block: 1});
          }
      }
    }

    return environment;
  }

  MapItemsType _getRandomType() {
    int random = Random().nextInt(8);
    return MapItemsType.values[random];
  }
}