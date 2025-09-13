import 'package:tank_battle_city/features/game_screen/models/game/map/map.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/position.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/direction.dart';

abstract class Tank {
  Tank({
    required this.healthPoint,
    required this.attach,
    required this.position,
    required this.direction,
    required this.map,
  });

  int healthPoint;
  int attach;
  Position position;
  Direction direction;
  GameMap map;

  bool get isAlive => healthPoint > 0;
  bool get isNotAlive => !isAlive;

  void move(List<Tank> tanks);

  Position? getPositionAfterTurnAndGo(Direction direction, int move) {
    late Position newPosition;

    switch (direction) {
      case Direction.north:
        for (int i = 0; i <= move; i++) {
          if (tankCanStand(position.x - i, position.y)) {
            newPosition = position.copyWith(x: position.x - i);
          } else {
            break;
          }
        }
        break;
      case Direction.south:
        for (int i = 0; i <= move; i++) {
          if (tankCanStand(position.x + i, position.y)) {
            newPosition = position.copyWith(x: position.x + i);
          } else {
            break;
          }
        }
        break;
      case Direction.west:
        for (int i = 0; i <= move; i++) {
          if (tankCanStand(position.x, position.y - i)) {
            newPosition = position.copyWith(y: position.y - i);
          } else {
            break;
          }
        }
        break;
      case Direction.east:
        for (int i = 0; i <= move; i++) {
          if (tankCanStand(position.x, position.y + i)) {
            newPosition = position.copyWith(y: position.y + i);
          } else {
            break;
          }
        }
        break;
    }

    return newPosition;
  }

  bool tankCanStand(int x, int y) {
    final blockType = map.getBlockTypeOrNull(x, y);
    if (blockType == MapItemsType.earth ||
        blockType == MapItemsType.ice ||
        blockType == MapItemsType.forest ||
        blockType == MapItemsType.ruinedWall) {
      return true;
    }

    return false;
  }

  Tank copyWith({int? healthPoint, int? attach, Position? position, Direction? direction, GameMap? map});
}
