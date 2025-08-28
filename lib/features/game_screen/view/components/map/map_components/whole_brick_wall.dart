import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';
import 'package:tank_battle_city/generated/assets.dart';

class WholeBrickWall extends StatelessWidget {
  const WholeBrickWall({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    final size = MediaQuery.of(context).size.width / presenter.mapSize;
    return SizedBox(height: size, width: size,child: Image.asset(Assets.imageBrickWhole),);
  }
}
