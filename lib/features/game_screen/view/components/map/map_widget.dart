import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/map_components.dart';
import 'package:tank_battle_city/features/game_screen/view/components/tanks/tanks.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_presenter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenPresenter>();

    return Row(children: [
      for (int y = 0; y < presenter.mapSize; y++) Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int x = 0; x < presenter.mapSize; x++) getBlockWidgetFromPosition(x, y, presenter)
        ],
      )
    ],);
  }

  Widget getBlockWidget (MapItemsType type) {
    switch (type) {
      case MapItemsType.water: return Water();
      case MapItemsType.earth: return Earth();
      case MapItemsType.concrete: return Concrete();
      case MapItemsType.forest: return Forest();
      case MapItemsType.halfRuinedWall: return HalfRuinedWall();
      case MapItemsType.ice: return Ice();
      case MapItemsType.ruinedWall: return RuinedWall();
      case MapItemsType.wholeBrickWall: return WholeBrickWall();
    }
  }

  Widget getBlockWidgetFromPosition (int x, int y, GameScreenPresenter presenter) {
    final type = presenter.getBlockType(x, y);
    var mapWidget = getBlockWidget(type);

    final game = presenter.game;
    if (game.blockWithTank(x, y)){
      mapWidget = Stack(
        children: [mapWidget, Center(
            child: DefaultTankBotWidget(direction: game.getTankFromPosition(x, y)!.direction))],
      );
    }


    return mapWidget;
  }
}
