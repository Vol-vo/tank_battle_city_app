import 'package:tank_battle_city/features/game/models/game/map/map.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tanks.dart';

class TurnState {
  const TurnState({required this.tanks, required this.map});

  final List<Tank> tanks;
  final GameMap map;

  TurnState copyWith({List<Tank>? tanks, GameMap? map}) {
    return TurnState(tanks: tanks ?? this.tanks, map: map ?? this.map);
  }
}
