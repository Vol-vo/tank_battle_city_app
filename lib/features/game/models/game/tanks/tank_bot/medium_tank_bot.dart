import 'dart:math';

import 'package:tank_battle_city/features/game/models/game/map/map.dart';
import 'package:tank_battle_city/features/game/models/game/map/position.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tank.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tank_difficulty.dart';

class MediumTankBot extends Tank {
  MediumTankBot({required super.position, required super.direction, required super.map, required super.name});

  @override
  int attach = 55;

  @override
  int healthPoint = 220;

  @override
  TankDifficulty tankDifficulty = TankDifficulty.medium;

  @override
  int get maxHealthPoint => 220;


  @override
  void firstMove(List<Tank> tanks) {
    List<Direction> directions = Direction.values;
    Direction dir = Direction.values[Random().nextInt(Direction.values.length)];

    for (int i = 0; i <= Direction.values.length - 1; i++) {
      for (int i = 1; i <= 3; i++) {
        final newPos = getPositionAfterTurnAndGo(dir, 1);
        if (newPos == null) {
          directions.removeAt(i);
        }
      }
    }

    direction = directions[Random().nextInt(directions.length)];
  }

  @override
  void secondMove(List<Tank> tanks) {
    final move = Random().nextInt(3) + 1;
    var newPosition = getPositionAfterTurnAndGo(direction, move);
    newPosition ??= getPositionAfterTurnAndGo(direction, 1);

    position = newPosition ?? position;
  }

  @override
  void thirdMove(List<Tank> tanks) {
    final List<Position> tankPositions = List.generate(tanks.length, (index) {
      return tanks[index].position;
    });

    final mapSize = map.size;
    for (var dir in Direction.values) {
      if (dir == Direction.north) {
        for (int i = position.x - 1; i >= 0; i--) {
          final visualPosition = position.copyWith(x: i);
          if (tankPositions.contains(visualPosition)) {
            direction = dir;
            return;
          }
        }
      } else if (dir == Direction.south) {
        for (int i = position.x + 1; i < mapSize; i++) {
          final visualPosition = position.copyWith(x: i);
          if (tankPositions.contains(visualPosition)) {
            direction = dir;
            return;
          }
        }
      } else if (dir == Direction.east) {
        for (int i = position.y + 1; i < mapSize; i++) {
          final visualPosition = position.copyWith(y: i);
          if (tankPositions.contains(visualPosition)) {
            direction = dir;
            return;
          }
        }
      } else if (dir == Direction.west) {
        for (int i = position.y - 1; i >= 0; i--) {
          final visualPosition = position.copyWith(y: i);
          if (tankPositions.contains(visualPosition)) {
            direction = dir;
            return;
          }
        }
      }
    }
    direction = Direction.values[Random().nextInt(Direction.values.length)];
  }


  @override
  MediumTankBot copyWith({Position? position, Direction? direction, GameMap? map}) {
    return MediumTankBot(
      position: position ?? this.position,
      direction: direction ?? this.direction,
      map: map ?? this.map,
      name: name,
    );
  }

}
