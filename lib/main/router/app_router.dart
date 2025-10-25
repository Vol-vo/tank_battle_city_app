import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tank_battle_city/features/game/models/game/settings/game_settings.dart';
import 'package:tank_battle_city/features/game/view/game_screen.dart';
import 'package:tank_battle_city/features/history_game/history_game_screen.dart';
import 'package:tank_battle_city/features/menu/menu_screen.dart';
import 'package:tank_battle_city/features/settings_game/settings_game_screen.dart';
import 'package:tank_battle_city/home/home_screen.dart';
import 'package:tank_battle_city/main/router/app_routers.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: MenuRoute.page,
          path: AppRoutes.menuScreen,
          initial: true,
        ),
        AutoRoute(
          page: HistoryGameRoute.page,
          path: AppRoutes.historyGameScreen,
        ),
      ],
    ),
    AutoRoute(
      page: SettingsGameRoute.page,
      path: '/${AppRoutes.settingsGameScreen}',
    ),
    AutoRoute(
      page: GameRoute.page,
      path: '/${AppRoutes.gameScreen}',
    ),
  ];
}
