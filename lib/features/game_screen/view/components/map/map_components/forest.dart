import 'package:flutter/material.dart';

class Forest extends StatelessWidget {
  const Forest({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.green, child: SizedBox(height: size, width: size,),);
  }
}
