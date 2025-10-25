import 'package:tank_battle_city/features/game/models/game/tanks/tank_difficulty.dart';

class GameSettings {
  const GameSettings({required this.bots, required this.countPlayer, required this.mapSize});

  final int mapSize;
  final int countPlayer;

  final List<TankDifficulty> bots;

}