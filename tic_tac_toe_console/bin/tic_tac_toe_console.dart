import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

import 'dart:io';

// problem
Position getMove(String input) {
  List<String> parts = input.split(RegExp(r'\D+'));
  List<int> numbers =
      parts.where((part) => part.isNotEmpty).map(int.parse).toList();
  Position move = Position(numbers[0], numbers[1]);
  return move;
}
// TOREDO

void main(List<String> arguments) {
  final game = IGame();
  game.strategy = IStrategy(EStrategy.hard);

  while (!game.isGameOver) {
    String? input;
    while (input == null) {
      print('Enter move position: ');
      input = stdin.readLineSync();
    }

    Position move = getMove(input);

    try {
      game.makeMove(move);
    } on InvalidInputException catch (e) {
      print(e.message);
    } on StrategyGetMoveError catch (e) {
      print(e.message);
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (game.board[i][j].isEmpty) {
          stdout.write('.');
        } else {
          stdout.write(game.board[i][j].name);
        }
        stdout.write(' ');
      }
      print('\n');
    }
  }

  print(game.gameResult?.name);
}
