import 'package:test/test.dart';
import 'package:tic_tac_toe_lib/src/game.dart';
import 'package:tic_tac_toe_lib/src/game_api/igame.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

void main() {
  group('Function verifyState() tests', () {
    Game game;

    test('State oWon vertical', () {
      game = Game(currentPlayer: EMark.O, boardConfig: [
        ['-', 'O', 'X'],
        ['-', 'O', '-'],
        ['X', 'O', 'X']
      ]);
      game.strategy = null;

      game.verifyState();

      expect(game.state, equals(EGameState.oWon));
      expect(game.isTimerRunning(), false);
    });

    test('State xWon horizontal', () {
      game = Game(currentPlayer: EMark.X, boardConfig: [
        ['-', 'O', 'X'],
        ['-', 'O', '-'],
        ['X', 'X', 'X']
      ]);
      game.strategy = null;

      game.verifyState();

      expect(game.state, equals(EGameState.xWon));
      expect(game.isTimerRunning(), false);
    });

    test('State xWon diagonal', () {
      game = Game(currentPlayer: EMark.X, boardConfig: [
        ['-', 'O', 'X'],
        ['-', 'X', '-'],
        ['X', 'O', 'X']
      ]);
      game.strategy = null;

      game.verifyState();

      expect(game.state, equals(EGameState.xWon));
      expect(game.isTimerRunning(), false);
    });

    test('State playing #0', () {
      game = Game(currentPlayer: EMark.X, boardConfig: [
        ['-', 'O', 'X'],
        ['-', '-', '-'],
        ['X', 'O', 'X']
      ]);
      game.strategy = null;

      game.verifyState();

      expect(game.state, equals(EGameState.playing));
      expect(game.isTimerRunning(), true);
    });

    test('State playing #1', () {
      game = Game(currentPlayer: EMark.X, boardConfig: [
        ['X', 'O', 'O'],
        ['O', 'X', '-'],
        ['X', 'O', 'O']
      ]);
      game.strategy = null;

      game.verifyState();

      expect(game.state, equals(EGameState.playing));
      expect(game.isTimerRunning(), true);
    });

    test('State draw', () {
      game = Game(currentPlayer: EMark.X, boardConfig: [
        ['X', 'O', 'O'],
        ['O', 'X', 'X'],
        ['X', 'O', 'O']
      ]);
      game.strategy = null;

      game.verifyState();

      expect(game.state, equals(EGameState.draw));
      expect(game.isTimerRunning(), false);
    });
  });

  group('Function restart() tests', () {
    Game game = Game(currentPlayer: EMark.X, boardConfig: [
      ['X', 'O', 'O'],
      ['O', 'X', '-'],
      ['X', 'O', 'O']
    ]);
    test('Test #0', () {
      game.strategy = null;

      game.restart();

      expect(game.isTimerRunning(), true);
      expect(game.state, EGameState.playing);
      expect(game.turn, EMark.X);
      expect(
          game.board,
          equals([
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty]
          ]));
    });

    test('Test #1', () {
      game.strategy = EStrategy.easy;

      game.restart();

      expect(game.isTimerRunning(), false);
      expect(game.state, EGameState.playing);
      expect(game.turn, EMark.X);
      expect(
          game.board,
          equals([
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty]
          ]));
    });

    test('Test #2', () {
      game.strategy = EStrategy.hard;

      game.restart();

      expect(game.isTimerRunning(), false);
      expect(game.state, EGameState.playing);
      expect(game.turn, EMark.X);
      expect(game.turn, EMark.X);
      expect(
          game.board,
          equals([
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty]
          ]));
    });
  });

  group('Function makeMove() tests', () {
    Game game = Game(currentPlayer: EMark.O, boardConfig: [
      ['-', 'O', 'X'],
      ['-', 'O', '-'],
      ['X', 'O', 'X']
    ]);
    test('Exception NotStatePlaying', () {
      expect(() => game.makeMove(Position(0, 1)), throwsA(isA<NotStatePlaying>()));
    });
  });
}
