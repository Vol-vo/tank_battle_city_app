import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game/view/components/control_button.dart';
import 'package:tank_battle_city/features/game/view/components/map/map_widget.dart';
import 'package:tank_battle_city/features/game/view/game_screen_view_model.dart';
import 'package:tank_battle_city/theme/app_color.dart';

class GameScreenView extends StatelessWidget {
  const GameScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<GameScreenViewModel>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white, size: 25),
          title: Text('Turns: ${presenter.countTurns.toString()}', style: TextStyle(color: Colors.white)),
          backgroundColor: AppColor.background,
        ),
        body: ColoredBox(
          color: AppColor.background,
          child: presenter.countTurns > 0
              ? Column(
                  children: [
                    MapWidget(),
                    ControlButton(),
                  ],
                )
              : Center(
                  child: SizedBox(width: 40, height: 40, child: CircularProgressIndicator(color: Colors.white)),
                ),
        ),
      ),
    );
  }
}
