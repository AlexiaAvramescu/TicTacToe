import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

final class GameState {
  late List<List<EMark>>? board;
  late EMark? turn;
  late EGameState? state;

  GameState({this.board, this.turn, this.state});
}
