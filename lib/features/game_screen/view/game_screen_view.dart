import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/view/components/control_button.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_widget.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';
import 'package:tank_battle_city/theme/app_color.dart';

class GameScreenView extends StatelessWidget {
  const GameScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();

    return SafeArea(
      child: StreamBuilder(
        stream: presenter.countTurns,
        builder: (context, asyncSnapshot) {
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: Text('Turns: ${presenter.countTurns.value.toString()}')),
            body: ColoredBox(
              color: AppColor.background,
              child: StreamBuilder(
                stream: presenter.mapIsGenerated,
                builder: (context, snapshot) {
                  if (snapshot.data == false || snapshot.data == null) {
                    return Center(
                      child: SizedBox(height: 35, width: 35, child: CircularProgressIndicator(color: Colors.white)),
                    );
                  }
                  return Column(
                    children: [
                      InteractiveViewer(child: MapWidget()),
                      ControlButton(),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
