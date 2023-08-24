import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/mixin_easy_startesy.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class EasyStrategy with EasyGetMove implements IStrategy {
  @override
  Position getMove({required Board board, EMark player = EMark.O}) {
    return easyGetMove(board: board, player: player);
  }
}
