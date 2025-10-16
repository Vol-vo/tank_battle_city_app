import 'dart:math';

import 'package:tank_battle_city/features/game_screen/models/game/map/map_blocks/map_block.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/position.dart';

class GameMap {
  GameMap({required this.size}) {
    init();
  }

  List<List<MapBlock>> blocks = [];

  final int size;

  void init() {
    _generateMap();
  }

  void dispose() {}

  MapBlock getBlock(int x, int y) {
    return blocks[y][x];
  }

  MapItemsType getBlockType(int x, int y) {
    return getBlock(x, y).type;
  }

  MapItemsType? getBlockTypeOrNull(int x, int y) {
    if (x < 0 || x >= size || y < 0 || y >= size) return null;
    return getBlockType(x, y);
  }

  void _generateMap() {
    blocks = List.generate(size, (y) => List.generate(size, (x) => _generateBlock(x, y)));
  }

  MapBlock _generateBlock(int x, int y) {
    var items = _getPossibleItems(x, y);

    return MapBlock(positions: Position(x, y), type: _getRandomType(items));
  }

  List<MapItemsType> _getPossibleItems(int x, int y) {
    final items = <MapItemsType>[];

    for (final item in MapItemsType.values) {
      if (item == MapItemsType.halfRuinedWall || item == MapItemsType.ruinedWall) continue;

      int weight = 1;

      if (item == MapItemsType.earth) weight += 9;
      items.addAll(List.filled(weight, item));
    }

    return items;
  }

  MapItemsType _getRandomType(List<MapItemsType> items) {
    int random = Random().nextInt(items.length);
    return items[random];
  }

  bool blockIsInterfereForFire(int x, int y) {
    final blockType = getBlockType(x, y);
    if (blockType == MapItemsType.concrete) {
      return true;
    } else if (blockType == MapItemsType.wholeBrickWall) {
      _setNewBlockType(x, y, MapItemsType.halfRuinedWall);
      return true;
    } else if (blockType == MapItemsType.halfRuinedWall) {
      _setNewBlockType(x, y, MapItemsType.ruinedWall);
      return true;
    }

    return false;
  }

  void _setNewBlockType(int x, int y, MapItemsType newType) {
    blocks[y][x] = blocks[y][x].copyWith(type: newType);
  }
}
