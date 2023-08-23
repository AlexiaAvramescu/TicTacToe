import 'package:tic_tac_toe_lib/src/game.dart';
import 'package:tic_tac_toe_lib/src/istrategy.dart';
import 'position.dart';

enum ETurn { X, O }

extension ETurnExtension on ETurn {
  ETurn get opposite {
    return this == ETurn.O ? ETurn.X : ETurn.O;
  }
}

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

  set strategy(IStrategy value);

  void makeMove(Position pos);
}
