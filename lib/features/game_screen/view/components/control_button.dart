import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_view_model.dart';
import 'package:tank_battle_city/theme/app_color.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenViewModel>();

    return Row(
      children: [
        SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: presenter.previousTurn,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.olive,
              side: BorderSide(width: 1, color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            child: Center(
              child: Text('PREVIOUS', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: presenter.nextTurn,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.olive,
              side: BorderSide(width: 1, color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            child: Center(
              child: Text('NEXT', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
