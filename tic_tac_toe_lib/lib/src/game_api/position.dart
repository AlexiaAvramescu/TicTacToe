class Position {
  Position(this._x, this._y);

  final int _x;
  final int _y;

  bool get isPositionValid => _x >= 0 && _x <= 2 && _y >= 0 && _y <= 2;
  int get x => _x;
  int get y => _y;

  @override
  String toString() => 'Position($_x, $_y)';
}
