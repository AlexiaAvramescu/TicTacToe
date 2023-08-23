import 'package:tic_tac_toe_lib/src/game.dart';
import 'position.dart';

enum ETurn { X, O }

enum EGameResult {
  xWon,
  oWon,
  draw,
}

abstract class IGame {
  factory IGame() => Game();

  bool get isGameOver;
  EGameResult? get gameResult;
  List<List<String?>> get board;

  void makeMove(Position pos);
}
