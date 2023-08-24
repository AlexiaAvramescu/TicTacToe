import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/mixin_easy_startesy.dart';
import 'package:tic_tac_toe_lib/src/mixin_hard_strategy.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class MediumStrategy
    with HardStrategyGetMove, EasyGetMove
    implements IStrategy {
  static bool strategyDecision = false;

  @override
  Position getMove({required Board board, EMark player = EMark.O}) {
    Position move;

    if (strategyDecision) {
      move = hardGetMove(board: board, player: player);
    } else {
      move = easyGetMove(board: board, player: player);
    }

    strategyDecision = !strategyDecision;
    return move;
  }
}
