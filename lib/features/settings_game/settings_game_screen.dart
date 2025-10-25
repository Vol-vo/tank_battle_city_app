import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tank_battle_city/features/game/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tank_difficulty.dart';
import 'package:tank_battle_city/main/router/app_router.dart';

@RoutePage()
class SettingsGameScreen extends StatelessWidget {
  const SettingsGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameSettings gameSettings = GameSettings(
      mapSize: 12,
      bots: [TankDifficulty.ease, TankDifficulty.ease, TankDifficulty.ease, TankDifficulty.ease],
      countPlayer: 0,
    );

    return ElevatedButton(
      onPressed: () {
        context.router.push(GameRoute(gameSettings: gameSettings));
      },
      child: Text('Start Game'),
    );
  }
}
