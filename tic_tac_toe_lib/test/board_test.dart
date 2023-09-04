import 'package:test/test.dart';
import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

void main() {
  group('Function validateInput tests', () {
    Board board = Board(matrixConfig: [
      ['-', '-', '-'],
      ['-', 'O', '-'],
      ['-', 'O', '-']
    ]);

    test('Out of Bound Input', () {
      expect(() => board.validateInput(Position(-1, 4)), throwsA(isA<OutOfBoundInputException>()));
    });

    test('Occupied Position Input', () {
      expect(() => board.validateInput(Position(1, 1)), throwsA(isA<OccupiedPositionException>()));
    });

    test('ValidInput #1', () {
      expect(() => board.validateInput(Position(1, 0)), isNot(throwsException));
    });

    test('ValidInput #2', () {
      expect(() => board.validateInput(Position(0, 0)), isNot(throwsException));
    });
  });

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
}
