import 'package:tic_tac_toe_lib/src/game_api/logger.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class Board {
  Board({required List<List<String>> matrixConfig}) {
    initializeBoard(matrixConfig: matrixConfig);
  }

  final MarkMatrix _matrix = [];
  final _boardLogger = logger(Board);

  MarkMatrix get matrix => _matrix;

  void initializeBoard({required List<List<String>> matrixConfig}) {
    _matrix.clear();
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
    _boardLogger.i('Board initialized.');
  }

  void restart() {
    initializeBoard(matrixConfig: [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]);
    _boardLogger.i('Board reset.');
  }

  void validateInput(Position pos) {
    if (!pos.isPositionValid) {
      _boardLogger.w('OutOfBoundException thrown');
      throw OutOfBoundInputException();
    }

    if (_matrix[pos.x][pos.y] != EMark.empty) {
      _boardLogger.w('OccupiedPositionException thrown');
      throw OccupiedPositionException();
    }
  }

  void makeMove(Position pos, EMark currentPlayer) {
    validateInput(pos);
    _matrix[pos.x][pos.y] = currentPlayer;
    _boardLogger.i('Player $currentPlayer made move.');
  }

  bool isMatrixFull() {
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (_matrix[i][j] == EMark.empty) return false;
      }
    }
    //_boardLogger.i('Board full.');
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

    if (_matrix[0][0] == turn && _matrix[1][1] == turn && _matrix[2][2] == turn) return true;

    if (_matrix[0][2] == turn && _matrix[1][1] == turn && _matrix[2][0] == turn) return true;

    return false;
  }
}
