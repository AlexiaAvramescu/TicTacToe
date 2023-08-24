import 'package:tic_tac_toe_lib/src/game.dart';
import 'package:tic_tac_toe_lib/src/game_api/istrategy.dart';
import 'position.dart';

enum EMark {
  X,
  O,
  empty;

  bool get isEmpty => this == empty;
  EMark get opposite {
    if (!isEmpty) return this == EMark.O ? EMark.X : EMark.O;
    return this;
  }
}

enum EGameState {
  xWon,
  oWon,
  draw,
  playing,
  paused;

  EGameState get gameState => this;
  bool get isGameOver => this != playing;
}

typedef MarkMatrix = List<List<EMark>>;

abstract class IGame {
  factory IGame() => Game();

  bool get isGameOver;
  EGameState? get gameResult;
  MarkMatrix get board;

  set strategy(IStrategy value);

  void restart();
  void makeMove(Position pos);
}
