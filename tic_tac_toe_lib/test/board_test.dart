import 'package:test/test.dart';
import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

void main() {
  group('Function currentPlayerWon tests', () {
    Board board;

    test('Player O won #1', () {
      board = Board(matrixConfig: [
        ['X', 'O', '-'],
        ['-', 'O', '-'],
        ['X', 'O', 'X']
      ]);
      expect(board.currentPlayerWon(EMark.O), isTrue);
    });

    test('Player O won #2', () {
      board = Board(matrixConfig: [
        ['X', 'O', 'X'],
        ['-', 'X', 'O'],
        ['O', 'O', 'O']
      ]);
      expect(board.currentPlayerWon(EMark.O), isTrue);
    });

    test('Player O won on full board', () {
      board = Board(matrixConfig: [
        ['X', 'O', 'X'],
        ['X', 'X', 'O'],
        ['O', 'O', 'O']
      ]);
      expect(board.currentPlayerWon(EMark.O), isTrue);
    });

    test('Player O didnt win', () {
      board = Board(matrixConfig: [
        ['-', '-', '-'],
        ['-', 'O', '-'],
        ['-', 'O', '-']
      ]);
      expect(board.currentPlayerWon(EMark.O), isFalse);
    });

    test('Player O didnt win full board', () {
      board = Board(matrixConfig: [
        ['X', 'O', 'X'],
        ['X', 'X', 'O'],
        ['O', 'X', 'O']
      ]);
      expect(board.currentPlayerWon(EMark.O), isFalse);
    });
  });

//  group('Function isMatrixFull', () => null)
}
