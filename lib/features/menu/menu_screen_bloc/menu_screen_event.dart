part of 'menu_screen_bloc.dart';

@immutable
sealed class MenuScreenEvent {}

class StartGameEvent extends MenuScreenEvent {
  StartGameEvent({required this.router});

  final StackRouter router;
}

class ResumeGameEvent extends MenuScreenEvent {}
