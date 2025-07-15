import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();

    return Row(children: [
      ElevatedButton(onPressed: presenter.previousTurn, child: Center(child: Text('PREVIOUS'),)),
      ElevatedButton(onPressed: presenter.nextTurn, child: Center(child: Text('NEXT'),)),
    ],);
  }
}
