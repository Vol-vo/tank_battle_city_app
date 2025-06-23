import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/menu_screen/menu_screen_bloc/menu_screen_bloc.dart';
import 'package:tank_battle_city/main/router/app_router.dart';

class StarterMain extends StatefulWidget {
  const StarterMain({super.key});

  @override
  State<StarterMain> createState() => _StarterMainState();
}

class _StarterMainState extends State<StarterMain> {

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => MenuScreenBloc(),)
    ], child: MaterialApp.router(
      routerConfig: appRouter.config(),
    ),);
  }
}
