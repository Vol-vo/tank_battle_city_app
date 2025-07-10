import 'package:tank_battle_city/features/game_screen/models/game/map/map.dart';
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

  Position getMove(List<Tank> tanks);

  Position? getPositionAfterTurnAndGo(Direction direction, int move) {
    late Position newPosition;

    switch (direction) {
      case Direction.north:
        newPosition = position.copyWith(y: position.y - move);
        break;
      case Direction.south:
        newPosition = position.copyWith(y: position.y + move);
        break;
      case Direction.west:
        newPosition = position.copyWith(x: position.x - move);
        break;
      case Direction.east:
        newPosition = position.copyWith(x: position.x - move);
        break;
    }

    if (newPosition.x < 0 || newPosition.x >= map.size || newPosition.y < 0 || newPosition.y >= map.size) return null;

    return newPosition;
  }
}
