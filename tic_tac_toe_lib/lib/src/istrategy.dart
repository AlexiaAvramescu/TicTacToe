import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

abstract class IStrategy{
  Position getMove(Board board, ETurn player);
}