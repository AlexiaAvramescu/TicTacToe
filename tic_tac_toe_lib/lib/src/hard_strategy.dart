
import 'dart:math';

import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/istrategy.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class HardStrategy implements IStrategy {
  @override
  Position getMove(Board board, ETurn player) {
    int bestVal = -1000;
    Position bestMove = Position(-1, -1);
    List<List<String?>> matrix = board.matrix;

    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (matrix[i][j] == '-') {
          matrix[i][j] = player.name;
          int moveVal = minimax(board, 0, false, player);
          matrix[i][j] = '-';

          if (moveVal > bestVal) {
            bestVal = moveVal;
            bestMove.changeTo(x: i, y: j);
          }
        }
      }
    }

    return bestMove;
  }

  bool isTermianlState(Board board) =>
      board.isMatrixFull() ||
      board.currentPlayerWon(ETurn.O) ||
      board.currentPlayerWon(ETurn.O);

  int stateValue(Board board, ETurn player) {
    if (board.currentPlayerWon(player)) return 10;
    if (board.currentPlayerWon(player.opposite)) return -10;
    return 0;
  }

  int minimax(Board board, int depth, bool isMax, ETurn player) {
    List<List<String?>> matrix = board.matrix;

    if (isTermianlState(board)) return stateValue(board, player);

    if (isMax) {
      int best = -1000;

      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          if (matrix[i][j] == '-') {
            matrix[i][j] = player.name;
            best = max(best, minimax(board, depth + 1, !isMax, player));
            matrix[i][j] = '-';
          }
        }
      }
      return best;
    } else {
      int best = 1000;

      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          if (matrix[i][j] == '-') {
            matrix[i][j] = player.opposite.name;
            best = min(best, minimax(board, depth + 1, !isMax, player));
            matrix[i][j] = '-';
          }
        }
      }
      return best;
    }
  }
}
