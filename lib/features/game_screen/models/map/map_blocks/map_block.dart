import 'package:tank_battle_city/features/game_screen/models/map/positions.dart';
import 'package:tank_battle_city/features/game_screen/models/map/map_items_type.dart';

class MapBlock {
  const MapBlock({required this.positions, required this.type});

  final Positions positions;
  final MapItemsType type;
  
}