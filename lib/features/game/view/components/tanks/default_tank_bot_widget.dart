import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tank_battle_city/features/game/models/game/tanks/tanks.dart';
import 'package:tank_battle_city/features/game/view/components/tanks/info_overlay.dart';
import 'package:tank_battle_city/features/game/view/game_screen_view_model.dart';
import 'dart:ui' as ui;

import 'package:tank_battle_city/generated/assets.dart';

class DefaultTankBotWidget extends StatefulWidget {
  const DefaultTankBotWidget({super.key, required this.tank});

  final Tank tank;

  @override
  State<DefaultTankBotWidget> createState() => _DefaultTankBotWidgetState();
}

class _DefaultTankBotWidgetState extends State<DefaultTankBotWidget> {
  Offset overlayPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        final newPosition = box.localToGlobal(Offset.zero);
        setState(() {
          overlayPosition = newPosition;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<GameScreenViewModel>();

    final direction = presenter.getTankDirection(widget.tank.position.x, widget.tank.position.y)!;
    final size = MediaQuery.of(context).size.width / presenter.mapSize;

    final OverlayPortalController overlayPortalController = OverlayPortalController();

    return GestureDetector(
      onLongPressStart: (details) {
        overlayPortalController.show();
      },
      onLongPressEnd: (details) {
        overlayPortalController.hide();
      },

      child: OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: (_) {
          return InfoOverlay(overlayPosition: overlayPosition, tank: widget.tank, sizeChild: size);
        },

        child: SizedBox(
          height: size,
          width: size,
          child: Transform.rotate(
            angle: presenter.getAngleFromDirection(direction),
            child: SvgPicture.asset(
              Assets.svgDefaultTank,
              colorFilter: ui.ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}

