import 'dart:math';
import 'package:tank_battle_city/features/game/models/game/map/map.dart';
import 'package:tank_battle_city/features/game/models/game/map/position.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tank.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tank_difficulty.dart';

class EasyTankBot extends Tank {
  EasyTankBot({
    required super.position,
    required super.direction,
    required super.map,
    required super.name,
  });

  @override
  int healthPoint = 190;
  @override
  int attach = 40;

  @override
  TankDifficulty tankDifficulty = TankDifficulty.ease;

  @override
  get maxHealthPoint => 190;

  @override
  void firstMove (List<Tank> tanks) {
    direction = Direction.values[Random().nextInt(4)];
  }

  @override
  void secondMove (List<Tank> tanks) {
    // final move = Random().nextInt(3);
    final move = 2;
    final newPosition = getPositionAfterTurnAndGo(direction, move);

    position = newPosition ?? position;
  }

  @override
  void thirdMove (List<Tank> tanks) {
    direction = Direction.values[Random().nextInt(4)];
  }

  @override
  void move(List<Tank> tanks) {
    final dir = Direction.values[Random().nextInt(4)];
    final move = Random().nextInt(3);
    final newPosition = getPositionAfterTurnAndGo(dir, move);

    direction = dir;
    position = newPosition ?? position;
  }

  @override
  EasyTankBot copyWith({Position? position, Direction? direction, GameMap? map}) {
    return EasyTankBot(
      position: position ?? this.position,
      direction: direction ?? this.direction,
      map: map ?? this.map,
      name: name,
    );
  }
}
