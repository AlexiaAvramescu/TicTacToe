import 'package:tic_tac_toe_lib/src/game_api/position.dart';
import 'package:tic_tac_toe_lib/src/game_api/igame.dart';

class Board {
  Board({required List<List<String>> matrixConfig}) {
    for (var i = 0; i < 3; i++) {
      final List<EMark> list = [];
      _matrix.add(list);
    }

    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (matrixConfig[i][j] == 'X') {
          _matrix[i].add(EMark.X);
        } else if (matrixConfig[i][j] == 'O') {
          _matrix[i].add(EMark.O);
        } else if (matrixConfig[i][j] == '-') {
          _matrix[i].add(EMark.empty);
        }
      }
    }
  }

  //late final List<List<String?>> _matrix; -- CHANGED
  final MarkMatrix _matrix = [];

  MarkMatrix get matrix => _matrix;

  void makeMove(Position pos, EMark turn) {
    _matrix[pos.x][pos.y] = turn;
  }

  bool isMatrixFull() {
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (_matrix[i][j] == EMark.empty) return false;
      }
    }
    return true;
  }

  bool currentPlayerWon(EMark turn) {
    for (var i = 0; i < 3; i++) {
      bool horizontalWin = true;
      for (var j = 0; j < 3; j++) {
        if (_matrix[i][j] != turn) horizontalWin = false;
      }
      if (horizontalWin) return true;
    }

    for (var j = 0; j < 3; j++) {
      bool verticalWin = true;
      for (var i = 0; i < 3; i++) {
        if (_matrix[i][j] != turn) verticalWin = false;
      }
      if (verticalWin) return true;
    }

    if (_matrix[0][0] == turn && _matrix[1][1] == turn && _matrix[2][2] == turn)
      return true;

    if (_matrix[0][2] == turn && _matrix[1][1] == turn && _matrix[2][0] == turn)
      return true;

    return false;
  }
}
