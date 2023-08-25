import 'package:tic_tac_toe_console/console.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

void main(List<String> arguments) {
  Console console = Console();
  IGame game = IGame();

  game.addListener(console);

  console.game = game;

  console.getStrategy();

  while (!console.isGameOver) {
    console.getInput();
    console.makeMove();
  }
}
