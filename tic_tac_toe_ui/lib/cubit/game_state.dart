import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

final class GameState {
  late List<List<EMark>>? board;
  late EMark? turn;
  late EGameState? state;
  late Duration? xDuration;
  late Duration? oDuration;

  GameState({this.board, this.turn, this.state, this.xDuration, this.oDuration});
}
