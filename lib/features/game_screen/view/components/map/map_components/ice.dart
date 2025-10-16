import 'package:flutter/material.dart';

class Ice extends StatelessWidget {
  const Ice({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.white, child: SizedBox(height: size, width: size,),);
  }
}
