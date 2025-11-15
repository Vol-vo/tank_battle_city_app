import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tank_battle_city/features/game/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game/view/components/map/map_components/map_components.dart';
import 'package:tank_battle_city/features/game/view/components/tanks/default_tank_widget.dart';
import 'package:tank_battle_city/features/game/view/game_screen_view_model.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameScreenViewModel>();
    final mapSize = viewModel.mapSize;
    final size = MediaQuery.of(context).size.width / mapSize;

    return Stack(
      children: [
        _MapWidget(mapSize: mapSize),

        for (var tank in viewModel.tanks)
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            top: tank.position.y * size,
            left: tank.position.x * size,
            child: DefaultTankWidget(tank: tank),
          ),

        for (int y = 0; y < mapSize; y++)
          for (int x = 0; x < mapSize; x++)
            if (viewModel.getBlockType(x, y) == MapItemsType.forest)
              Positioned(
                top: y * size,
                left: x * size,
                child: _GetBlockWidgetFromPosition(x: x, y: y),
              ),
      ],
    );
  }
}

class _MapWidget extends StatelessWidget {
  const _MapWidget({required this.mapSize});

  final int mapSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int x = 0; x < mapSize; x++)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [for (int y = 0; y < mapSize; y++) _GetBlockWidgetFromPosition(x: x, y: y)],
          ),
      ],
    );
  }
}

class _GetBlockWidgetFromPosition extends StatelessWidget {
  const _GetBlockWidgetFromPosition({required this.x, required this.y});

  final int x;
  final int y;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameScreenViewModel>();
    final mapSize = viewModel.mapSize;
    final size = MediaQuery.of(context).size.width / mapSize;

    final type = viewModel.getBlockType(x, y);
    var mapWidget = getBlockWidget(type, size);

    // if (viewModel.blockWithTank(x, y) && type != MapItemsType.forest) {
    //   mapWidget = Stack(
    //     children: [
    //       mapWidget,
    //       Center(child: DefaultTankWidget(tank: viewModel.getTankFromPosition(x, y)!)),
    //     ],
    //   );
    // }

    return mapWidget;
  }

  Widget getBlockWidget(MapItemsType type, double size) {
    switch (type) {
      case MapItemsType.water:
        return Water(size: size);
      case MapItemsType.earth:
        return Earth(size: size);
      case MapItemsType.concrete:
        return Concrete(size: size);
      case MapItemsType.forest:
        return Forest(size: size);
      case MapItemsType.halfRuinedWall:
        return HalfRuinedWall(size: size);
      case MapItemsType.ice:
        return Ice(size: size);
      case MapItemsType.ruinedWall:
        return RuinedWall(size: size);
      case MapItemsType.wholeBrickWall:
        return WholeBrickWall(size: size);
    }
  }
}
