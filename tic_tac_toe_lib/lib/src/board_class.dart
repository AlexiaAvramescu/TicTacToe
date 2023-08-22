import 'package:tic_tac_toe_lib/src/position_class.dart';
import 'package:tic_tac_toe_lib/src/tic_tac_toe_api.dart';

class Board {
  Board() {
    final list = List.filled(3, null);
    _matrix = List.filled(3, list);
  }

  late final List<List<String?>> _matrix;

  List<List<String?>> get matrix => _matrix;
  void makeMove(Position pos, ETurn turn) {
    _matrix[pos.x][pos.y] = turn.name;
  }

  bool currentPlayerWon(ETurn turn) {
    int horizontalCount = 0;
    int verticalCount = 0;
    int diagonalCount = 0;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (_matrix[i][j] == turn.name) return false;
      }
    }
    return true;
  }
}
