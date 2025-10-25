import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_battle_city/features/game/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game/view/game_screen_view.dart';
import 'package:tank_battle_city/features/game/view/game_screen_view_model.dart';

@RoutePage()
class GameScreen extends StatelessWidget {
  const GameScreen({super.key, required this.gameSettings});

  final GameSettings gameSettings;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameScreenViewModel>(
        create: (_)  => GameScreenViewModel(gameSettings: gameSettings),
        child: GameScreenView());
  }
}
