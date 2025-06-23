import 'package:flutter/material.dart';
import 'package:tank_battle_city/di/injectable_config.dart';
import 'package:tank_battle_city/main/starter_main.dart';

void main() {
  configureDependencies();
  runApp(StarterMain());
}


