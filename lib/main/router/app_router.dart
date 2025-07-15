import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen.dart';
import 'package:tank_battle_city/features/history_game_screen/history_game_screen.dart';
import 'package:tank_battle_city/features/menu_screen/menu_screen.dart';
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
          page: MenuWrapperRoute.page,
          children: [
            AutoRoute(
              page: MenuRoute.page,
              path: AppRoutes.menuScreen,
              initial: true,
            ),
          ],
        ),
        AutoRoute(page: HistoryGameRoute.page, path: AppRoutes.historyGameScreen),
      ],
    ),
    AutoRoute(page: GameRoute.page, path: '/${AppRoutes.gameScreen}'),
  ];
}
