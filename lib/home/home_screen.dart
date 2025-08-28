import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tank_battle_city/main/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: [MenuRoute(), HistoryGameRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu_outlined), label: 'Меню'),
            BottomNavigationBarItem(icon: Icon(Icons.history_outlined), label: 'История'),
          ],
        );
      },

    );
  }
}
