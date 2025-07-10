
import 'package:tank_battle_city/features/game_screen/models/game/map/map_items_type.dart';
import 'package:tank_battle_city/features/game_screen/models/game/map/position.dart';

class MapBlock {
  const MapBlock({required this.positions, required this.type});

  final Position positions;
  final MapItemsType type;
  
}