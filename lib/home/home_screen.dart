import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tank_battle_city/main/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final appRouter = ;

  @override
  void initState() {
    super.initState();
    // appRouter = GetIt.I<AppRouter>();
  }

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
      // builder: (context, child) {
      //   final tabsRouter = AutoTabsRouter.of(context);
      //   return Scaffold(
      //     body: child,
      //     bottomNavigationBar: BottomNavigationBar(items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.menu_outlined), label: 'Меню'),
      //       BottomNavigationBarItem(icon: Icon(Icons.history_outlined), label: 'История'),
      //     ],
      //     onTap: (index){
      //       tabsRouter.setActiveIndex(index);
      //     },
      //     currentIndex: tabsRouter.activeIndex,
      //     ),
      //   );
      // },
    );
  }
}
