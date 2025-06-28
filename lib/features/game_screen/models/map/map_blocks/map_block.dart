import 'package:tank_battle_city/features/game_screen/models/map/position.dart';
import 'package:tank_battle_city/features/game_screen/models/map/map_items_type.dart';

class MapBlock {
  const MapBlock({required this.positions, required this.type});

  final Position positions;
  final MapItemsType type;
  
}