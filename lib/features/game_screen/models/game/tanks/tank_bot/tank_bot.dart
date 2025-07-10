import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/position.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/tank.dart';


class DefaultTankBot extends Tank {
  DefaultTankBot({
    super.healthPoint = 200,
    super.attach = 40,
    required super.position,
    required super.direction,
    required super.map,
  });

  @override
  Position getMove(List<Tank> tanks) {
    final dir = Direction.values[Random().nextInt(4)];
    final move = Random().nextInt(3);
    final newPosition = getPositionAfterTurnAndGo(dir, move);

    return newPosition ?? position;
  }

}
