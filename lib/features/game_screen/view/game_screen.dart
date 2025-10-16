import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_view.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_view_model.dart';

@RoutePage()
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameScreenViewModel>(
        create: (_)  => GameScreenViewModel(),
        child: GameScreenView());
  }
}
