import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/strategy/mixin_hard_strategy.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class HardStrategy with HardStrategyGetMove implements IStrategy {
  @override
  Position getMove({required Board board, EMark player = EMark.O}) {
    return hardGetMove(board: board, player: player);
  }
}
