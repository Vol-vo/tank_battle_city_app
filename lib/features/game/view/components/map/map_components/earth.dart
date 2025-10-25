import 'package:flutter/material.dart';

class Earth extends StatelessWidget {
  const Earth({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.black, child: SizedBox(height: size, width: size,),);
  }
}
