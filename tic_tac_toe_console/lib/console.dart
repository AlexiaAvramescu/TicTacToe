import 'dart:io';

import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class Console extends IListener {
  IGame _game = IGame();
  Position _move = Position(-1, -1);

  Console();

  set game(IGame game) => _game = game;

  void strategy(EStrategy val) => _game.strategy = IStrategy(val);

  void getStrategy() {
    String? input;
    while (input != 'easy' && input != 'medium' && input != 'hard') {
      print('Enter dificulty: ');
      input = stdin.readLineSync();
    }

    if (input == 'easy') {
      strategy(EStrategy.easy);
    } else if (input == 'medium') {
      strategy(EStrategy.medium);
    } else if (input == 'hard') {
      strategy(EStrategy.hard);
    }
  }

  void getInput() {
    String? input;
    while (input == null) {
      print('Enter move position: ');
      input = stdin.readLineSync();
    }

    _move = getMove(input);
  }

  void makeMove() {
    try {
      _game.makeMove(_move);
    } on InvalidInputException catch (e) {
      print(e.message);
    } on StrategyGetMoveError catch (e) {
      print(e.message);
    }
  }

  bool get isGameOver => _game.isGameOver;

  void printBoard() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_game.board[i][j].isEmpty) {
          stdout.write('.');
        } else {
          stdout.write(_game.board[i][j].name);
        }
        stdout.write(' ');
      }
      print('\n');
    }
  }

  Position getMove(String input) {
    List<String> parts = input.split(RegExp(r'\D+'));
    List<int> numbers = parts.where((part) => part.isNotEmpty).map(int.parse).toList();
    Position move = Position(numbers[0], numbers[1]);
    return move;
  }

  @override
  void onMarkMade() {
    printBoard();
  }

  @override
  void onGameOver(EGameState state) {
    printBoard();
    print(state);
  }

  @override
  void onExit() {
    print('Game exited.');
  }

  @override
  void onReset() {
    printBoard();
  }
}
