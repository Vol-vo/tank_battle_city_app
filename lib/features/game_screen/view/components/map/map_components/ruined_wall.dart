import 'package:flutter/material.dart';

class RuinedWall extends StatelessWidget {
  const RuinedWall({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    // Temporarily
    // TODO(volvo): add normal texture
    // return Opacity(opacity: 0.2, child: SizedBox(height: size, width: size,child: Image.asset(Assets.imageBrickWhole),));
    return ColoredBox(color: Colors.black, child: SizedBox(height: size, width: size,),);
  }
}
