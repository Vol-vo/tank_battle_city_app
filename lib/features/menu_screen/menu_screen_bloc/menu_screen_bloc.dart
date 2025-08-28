import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:tank_battle_city/main/router/app_router.dart';

part 'menu_screen_event.dart';
part 'menu_screen_state.dart';

class MenuScreenBloc extends Bloc<MenuScreenEvent, MenuScreenState> {

  MenuScreenBloc() : super(MenuScreenInitial()) {
    on<MenuScreenEvent>((_, __){});
    on<StartGameEvent>(_startGame);
  }


  _startGame(event, emit){
    event as StartGameEvent;
    event.router.push(GameRoute());
  }
}
