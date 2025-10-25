import 'package:flutter/material.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tank.dart';

class InfoOverlay extends StatelessWidget {
  const InfoOverlay({super.key, required this.overlayPosition, required this.tank, required this.sizeChild});

  final Offset overlayPosition;
  final Tank tank;
  final double sizeChild;

  static const double infoWidth = 150;
  static const double infoHeight = 90;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (overlayPosition == Offset.zero) return const SizedBox.shrink();

    if (overlayPosition.dy < screenSize.height / 2 &&
        overlayPosition.dx > infoWidth / 2 &&
        overlayPosition.dx < screenSize.width - infoWidth / 2) {
      // Top
      return Positioned(
        bottom: screenSize.height - overlayPosition.dy,
        left: overlayPosition.dx - infoWidth / 2 + sizeChild / 2,
        child: _Info(tank: tank),
      );
    } else if (overlayPosition.dx > infoWidth && overlayPosition.dy > infoHeight) {
      // Left
      return Positioned(
        top: overlayPosition.dy - infoHeight / 2,
        right: screenSize.width - overlayPosition.dx,
        child: _Info(tank: tank),
      );
    } else {
      // Right
      return Positioned(
        top: overlayPosition.dy - infoHeight / 2 + sizeChild,
        left: overlayPosition.dx + sizeChild,
        child: _Info(tank: tank),
      );
    }
  }
}

class _Info extends StatelessWidget {
  const _Info({required this.tank});

  static const double infoWidth = InfoOverlay.infoWidth;
  static const double infoHeight = InfoOverlay.infoHeight;

  final Tank tank;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: infoHeight,
      width: infoWidth,
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [Text(tank.name), Text('healthPoint: ${tank.healthPoint}'), Text('attach: ${tank.attach}')],
        ),
      ),
    );
  }
}
