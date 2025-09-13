import 'dart:math';

import 'package:tank_battle_city/features/game_screen/models/game/map/map.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/position.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/tank.dart';

class DefaultTankBot extends Tank {
  DefaultTankBot({
    super.healthPoint = 10,
    super.attach = 40,
    required super.position,
    required super.direction,
    required super.map,
  });

  @override
  void move(List<Tank> tanks) {
    print('===============');
    print('hp: $healthPoint');
    final dir = Direction.values[Random().nextInt(4)];
    final move = Random().nextInt(3);
    final newPosition = getPositionAfterTurnAndGo(dir, move);

    direction = dir;
    position = newPosition ?? position;
  }

  @override
  DefaultTankBot copyWith({int? healthPoint, int? attach, Position? position, Direction? direction, GameMap? map}) {
    return DefaultTankBot(
      healthPoint: healthPoint ?? this.healthPoint,
      attach: attach ?? this.attach,
      position: position ?? this.position,
      direction: direction ?? this.direction,
      map: map ?? this.map,
    );
  }
}
