import 'package:flutter/material.dart';
import 'package:tank_battle_city/generated/assets.dart';

class Water extends StatelessWidget {
  const Water({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.imageWaterDefault, height: size, width: size,);
  }
}
