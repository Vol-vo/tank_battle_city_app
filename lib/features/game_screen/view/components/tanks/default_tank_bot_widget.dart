import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tank_battle_city/features/game_screen/models/game/tanks/direction.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';
import 'dart:ui' as ui;

import 'package:tank_battle_city/generated/assets.dart';

class DefaultTankBotWidget extends StatelessWidget {
  const DefaultTankBotWidget({super.key, required this.direction});

  final Direction direction;

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    final size = MediaQuery.of(context).size.width / presenter.mapSize;

    return Transform.rotate(
      angle: presenter.getAngleFromDirection(direction),
      child: SizedBox(height: size, width: size, child: SvgPicture.asset(Assets.svgDefaultTank, colorFilter: ui.ColorFilter.mode(Colors.white, BlendMode.srcIn),)),
    );
  }
}
