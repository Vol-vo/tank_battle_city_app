import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    final map = presenter.map;

    return OverflowBox(child:
    Row(children: [
      for (int y = 0; y < presenter.sizeMap; y++) Column(
        children: [
          for (int x = 0; x < presenter.sizeMap; x++) presenter.getBlockWidgetFromPosition(x, y)
        ],
      )
    ],),);
  }
}
