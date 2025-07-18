import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class Water extends StatelessWidget {
  const Water({super.key});


  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    final size = MediaQuery.of(context).size.width / presenter.mapSize;
    return ColoredBox(color: Colors.blue, child: SizedBox(height: size, width: size,),);
  }
}
