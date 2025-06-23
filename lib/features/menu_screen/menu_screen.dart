import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/menu_screen/menu_screen_bloc/menu_screen_bloc.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuScreenBloc menuBloc = context.read<MenuScreenBloc>();
    return SafeArea(
      child: Column(
        children: [
        ElevatedButton(onPressed: (){
          print('print1');
      menuBloc.add(StartGameEvent(router: context.router));
    }, child: Text('Стартуем')),
        ],
      ),
    );
  }
}

@RoutePage()
class MenuWrapperScreen extends StatelessWidget {
  const MenuWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }

}


