import 'package:equatable/equatable.dart';

class Position extends Equatable {
  Position(this._x, this._y);

  final int _x;
  final int _y;

  bool get isPositionValid => _x >= 0 && _x <= 2 && _y >= 0 && _y <= 2;
  int get x => _x;
  int get y => _y;

  Position copyWith({int? x, int? y}) {
    return Position(x ?? _x, y ?? _y);
  }

  @override
  List<Object?> get props => [_x, _y];

  @override
  bool get stringify => true;

  @override
  String toString() => 'Position($_x, $_y)';
}
