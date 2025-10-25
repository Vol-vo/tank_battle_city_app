part of 'menu_screen_bloc.dart';

@immutable
sealed class MenuScreenState {}

final class MenuScreenInitial extends MenuScreenState {}

final class GameIsProcessing extends MenuScreenState {

}
