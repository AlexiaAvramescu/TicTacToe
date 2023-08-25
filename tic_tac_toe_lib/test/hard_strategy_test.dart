import 'package:test/test.dart';
import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/strategy/hard_strategy.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

void main() {
  HardStrategy strategy = HardStrategy();

  test('Block win #1', () {
    Board board = Board(matrixConfig: [
      ['X', '-', '-'],
      ['-', 'X', '-'],
      ['-', 'O', '-']
    ]);
    Position move = strategy.getMove(board: board, player: EMark.O);
    expect(move, Position(2, 2));
  });

  test('Block win #2', () {
    Board board = Board(matrixConfig: [
      ['-', '-', 'X'],
      ['-', 'X', '-'],
      ['O', 'X', 'O']
    ]);
    Position move = strategy.getMove(board: board, player: EMark.O);
    expect(move, equals(Position(0, 1)));
  });

  test('Block win #3', () {
    Board board = Board(matrixConfig: [
      ['X', '-', '-'],
      ['-', 'O', '-'],
      ['X', '-', '-']
    ]);
    Position move = strategy.getMove(board: board, player: EMark.O);
    expect(move, equals(Position(1, 0)));
  });

  test('Block win #4', () {
    Board board = Board(matrixConfig: [
      ['-', 'O', '-'],
      ['-', 'X', '0'],
      ['X', '-', 'X']
    ]);
    Position move = strategy.getMove(board: board, player: EMark.O);
    expect(move, equals(Position(0, 2)));
  });

  test('Block win #5', () {
    Board board = Board(matrixConfig: [
      ['-', 'X', 'X'],
      ['-', 'O', '-'],
      ['O', '-', 'X']
    ]);
    Position move = strategy.getMove(board: board, player: EMark.O);
    expect(move, equals(Position(1, 2)));
  });

  test('Get win #1', () {
    Board board = Board(matrixConfig: [
      ['X', '-', '-'],
      ['X', 'O', '-'],
      ['O', '-', 'X']
    ]);
    Position move = strategy.getMove(board: board, player: EMark.O);
    expect(move, equals(Position(0, 2)));
  });
}
