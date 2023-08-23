class Position {
  Position(this._x, this._y);

  int _x;
  int _y;

  bool get isPositionValid => _x >= 0 && _x <= 2 && _y >= 0 && _y <= 2;
  int get x => _x;
  int get y => _y;

  void changeTo({int x = 0, int y = 0}) {
      _x = x;
      _y = y;
  }

  @override
  String toString() => 'Position($_x, $_y)';
}
