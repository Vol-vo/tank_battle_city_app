import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/view/components/map/map_components/map_components.dart';
import 'package:tank_battle_city/features/game_screen/view/components/tanks/tank_widgets.dart';
import 'package:tank_battle_city/features/game_screen/view/game_screen_view_model.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<GameScreenViewModel>();
    final mapSize = presenter.mapSize;
    final size = MediaQuery.of(context).size.width / mapSize;
    return Row(children: [
      for (int y = 0; y < mapSize; y++) Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int x = 0; x < mapSize; x++) getBlockWidgetFromPosition(x, y, presenter, size)
        ],
      )
    ],);
  }

  Widget getBlockWidget (MapItemsType type, double size) {
    switch (type) {
      case MapItemsType.water: return Water(size: size,);
      case MapItemsType.earth: return Earth(size: size,);
      case MapItemsType.concrete: return Concrete(size: size,);
      case MapItemsType.forest: return Forest(size: size,);
      case MapItemsType.halfRuinedWall: return HalfRuinedWall(size: size,);
      case MapItemsType.ice: return Ice(size: size,);
      case MapItemsType.ruinedWall: return RuinedWall(size: size,);
      case MapItemsType.wholeBrickWall: return WholeBrickWall(size: size,);
    }
  }

  Widget getBlockWidgetFromPosition (int x, int y, GameScreenViewModel presenter, double size) {
    final type = presenter.getBlockType(x, y);
    var mapWidget = getBlockWidget(type, size);

    if (presenter.blockWithTank(x, y) && type != MapItemsType.forest){
      mapWidget = Stack(
        children: [mapWidget, Center(
            child: DefaultTankBotWidget(tank: presenter.getTankFromPosition(x, y)!))],
      );
    }

    return mapWidget;
  }
}
