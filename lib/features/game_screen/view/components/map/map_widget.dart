import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();

    return Row(children: [
      for (int y = 0; y < presenter.mapSize; y++) Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int x = 0; x < presenter.mapSize; x++) presenter.getBlockWidgetFromPosition(x, y)
        ],
      )
    ],);
  }
}
