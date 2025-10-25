// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<GameRouteArgs> {
  GameRoute({
    Key? key,
    required GameSettings gameSettings,
    List<PageRouteInfo>? children,
  }) : super(
         GameRoute.name,
         args: GameRouteArgs(key: key, gameSettings: gameSettings),
         initialChildren: children,
       );

  static const String name = 'GameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GameRouteArgs>();
      return GameScreen(key: args.key, gameSettings: args.gameSettings);
    },
  );
}

class GameRouteArgs {
  const GameRouteArgs({this.key, required this.gameSettings});

  final Key? key;

  final GameSettings gameSettings;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, gameSettings: $gameSettings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GameRouteArgs) return false;
    return key == other.key && gameSettings == other.gameSettings;
  }

  @override
  int get hashCode => key.hashCode ^ gameSettings.hashCode;
}

/// generated route for
/// [HistoryGameScreen]
class HistoryGameRoute extends PageRouteInfo<void> {
  const HistoryGameRoute({List<PageRouteInfo>? children})
    : super(HistoryGameRoute.name, initialChildren: children);

  static const String name = 'HistoryGameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HistoryGameScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
    : super(MenuRoute.name, initialChildren: children);

  static const String name = 'MenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MenuScreen();
    },
  );
}

/// generated route for
/// [SettingsGameScreen]
class SettingsGameRoute extends PageRouteInfo<void> {
  const SettingsGameRoute({List<PageRouteInfo>? children})
    : super(SettingsGameRoute.name, initialChildren: children);

  static const String name = 'SettingsGameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsGameScreen();
    },
  );
}
