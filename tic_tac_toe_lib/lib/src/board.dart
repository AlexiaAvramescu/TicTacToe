import 'package:tic_tac_toe_lib/src/game_api/position.dart';
import 'package:tic_tac_toe_lib/src/game_api/igame.dart';

class Board {
  Board({required List<List<String>> matrixConfig }) {
    for (var i = 0; i < 3; i++) {
      final List<String> list = matrixConfig[i];
      // for (var i = 0; i < 3; i++) {
      //   list.add('-');
      // }
      _matrix.add(list);
    }
  }

  //late final List<List<String?>> _matrix; -- CHANGED
  final List<List<String?>> _matrix = [];

  List<List<String?>> get matrix => _matrix;

  void makeMove(Position pos, ETurn turn) {
    _matrix[pos.x][pos.y] = turn.name;
  }

  bool isMatrixFull()
  {
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if(_matrix[i][j] == '-') return false;
      }
    }
    return true;
  }

  bool currentPlayerWon(ETurn turn) {
    for (var i = 0; i < 3; i++) {
      bool horizontalWin = true;
      for (var j = 0; j < 3; j++) {
        if (_matrix[i][j] != turn.name) horizontalWin = false;
      }
      if (horizontalWin) return true;
    }

    for (var j = 0; j < 3; j++) {
      bool verticalWin = true;
      for (var i = 0; i < 3; i++) {
        if (_matrix[i][j] != turn.name) verticalWin = false;
      }
      if (verticalWin) return true;
    }

    if (_matrix[0][0] == turn.name &&
        _matrix[1][1] == turn.name &&
        _matrix[2][2] == turn.name) return true;

    if (_matrix[0][2] == turn.name &&
        _matrix[1][1] == turn.name &&
        _matrix[2][0] == turn.name) return true;

    return false;
  }
}
