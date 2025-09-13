import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class Concrete extends StatelessWidget {
  const Concrete({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();
    final size = MediaQuery.of(context).size.width / presenter.mapSize;
    final countMiniBlock = 2;
    return Column(
      children: [
        for (int i = 0; i < countMiniBlock; i++)
          Row(
            children: [
              for (int j = 0; j < countMiniBlock; j++)
                SizedBox(
                  height: size / countMiniBlock,
                  width: size / countMiniBlock,
                  child: CustomPaint(painter: _ConcreteCustomPainter()),
                ),
            ],
          ),
      ],
    );
  }
}

class _ConcreteCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintMiniReact = Paint()..color = Colors.white;
    final paintBackgroundLight = Paint()..color = Colors.white60;
    final paintBackgroundDark = Paint()..color = Colors.white10;

    final pathLight = Path();
    pathLight.lineTo(0, 0);
    pathLight.lineTo(size.width, 0);
    pathLight.lineTo(0, size.height);
    pathLight.close();

    final pathDark = Path();
    pathDark.lineTo(0, size.height);
    pathDark.lineTo(size.width, size.height);
    pathDark.lineTo(size.width, 0);
    pathDark.close();

    canvas.drawPath(pathLight, paintBackgroundLight);
    canvas.drawPath(pathDark, paintBackgroundDark);
    canvas.drawRect(
      Rect.fromLTRB(size.width * 0.25, size.height * 0.25, size.width * 0.75, size.height * 0.75),
      paintMiniReact,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
