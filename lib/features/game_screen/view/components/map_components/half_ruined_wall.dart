import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class HalfRuinedWall extends StatelessWidget {
  const HalfRuinedWall({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    final size = MediaQuery.of(context).size.width / presenter.sizeMap;
    return ColoredBox(color: Colors.black, child: SizedBox(height: size, width: size,),);
  }
}
