import 'package:flutter/material.dart';
import 'package:tank_battle_city/generated/assets.dart';

class WholeBrickWall extends StatelessWidget {
  const WholeBrickWall({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size, width: size,child: Image.asset(Assets.imageBrickWhole),);
  }
}
