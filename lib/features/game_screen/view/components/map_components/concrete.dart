import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class Concrete extends StatelessWidget {
  const Concrete({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    return ColoredBox(color: Colors.white54, child: SizedBox(height: presenter.sizeMap.toDouble(), width: presenter.sizeMap.toDouble(),),);
  }
}
