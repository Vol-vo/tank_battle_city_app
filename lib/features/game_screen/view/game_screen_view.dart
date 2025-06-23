import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map_widget.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';
import 'package:tank_battle_city/theme/app_color.dart';

class GameScreenView extends StatelessWidget {
  const GameScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();

    return SafeArea(
      child: ColoredBox(color: AppColor.background, child:
      InteractiveViewer(
        child: StreamBuilder(stream: presenter.mapIsGenerated, builder: (context, snapshot) {
          if (snapshot.data == false) return CircularProgressIndicator();
          return MapWidget();
        }),
      )
        ,),
    );
  }
}
