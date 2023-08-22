import 'package:tic_tac_toe_lib/src/tic_tac_toe_lib_base.dart';

enum ETurn { X, O }

enum EGameResult {
  X_Won,
  O_Won,
}

abstract class IGame {
  factory IGame() => Game();

  bool get isGameOver;
  EGameResult? get getGameResult;
  List<List<String?>> get getBoard;

  bool isInputValid(Position pos);
  void makeMove(Position pos);
}
