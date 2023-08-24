import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/hard_strategy.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

enum EStrategy {
  easy,
  medium,
  hard;
}

abstract class IStrategy {
  factory IStrategy(EStrategy val) {
    switch (val) {
      case EStrategy.easy:
        return HardStrategy();
      case EStrategy.medium:
        return HardStrategy();
      case EStrategy.hard:
        return HardStrategy();
    }
  }
  Position getMove(Board board, EMark player);
}
