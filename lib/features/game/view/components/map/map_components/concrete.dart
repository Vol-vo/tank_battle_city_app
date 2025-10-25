import 'package:flutter/material.dart';

class Concrete extends StatelessWidget {
  const Concrete({super.key, required this.size});

  final double size;
  static const countMiniBlock = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < countMiniBlock; i++)
          Row(
            children: [
              for (int j = 0; j < countMiniBlock; j++)
                SizedBox(
                  height: size / countMiniBlock,
                  width: size / countMiniBlock,
                  child: const CustomPaint(painter: _ConcreteCustomPainter()),
                ),
            ],
          ),
      ],
    );
  }
}

class _ConcreteCustomPainter extends CustomPainter {
  const _ConcreteCustomPainter();

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
