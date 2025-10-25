import 'package:flutter/material.dart';
import 'package:tank_battle_city/generated/assets.dart';

class HalfRuinedWall extends StatelessWidget {
  const HalfRuinedWall({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    // Temporarily
    // TODO(volvo): add normal texture
    return Opacity(opacity: 0.6, child: SizedBox(height: size, width: size,child: Image.asset(Assets.imageBrickWhole),));
  }
}
