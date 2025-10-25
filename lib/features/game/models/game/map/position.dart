class Position {
  const Position(this.x, this.y);

  final int x;
  final int y;

  Position copyWith({int? x, int? y}) {
    return Position(x ?? this.x, y ?? this.y);
  }

  @override
  bool operator ==(Object other) {
    if (other is Position && other.x == x && other.y == y){
      return true;
    }
    return super == other;
  }

}