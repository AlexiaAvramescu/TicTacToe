import 'package:tic_tac_toe_lib/src/game.dart';
import 'package:tic_tac_toe_lib/src/game_api/istrategy.dart';
import 'package:tic_tac_toe_lib/src/listener.dart';
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

enum ECommand {
  restart,
  exit;
}

enum EGameState {
  xWon,
  oWon,
  draw,
  playing,
  paused,
  exit;

  EGameState get gameState => this;
  bool get isGameOver => this != playing;
}

typedef MarkMatrix = List<List<EMark>>;

abstract class IGame {
  factory IGame() => Game();

  bool get isGameOver;
  bool get isStateExit;
  EGameState? get gameResult;
  MarkMatrix get board;

  set strategy(IStrategy value);

  void addListener(IListener listener);
  void removeListener(IListener listener);

  void restart();
  void playerComand(ECommand command);
  void makeMove(Position pos);
}
