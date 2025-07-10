import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class Ice extends StatelessWidget {
  const Ice({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    final size = MediaQuery.of(context).size.width / presenter.mapSize;
    return ColoredBox(color: Colors.white, child: SizedBox(height: size, width: size,),);
  }
}
