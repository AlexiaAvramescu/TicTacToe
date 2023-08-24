import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/easy_strategy.dart';
import 'package:tic_tac_toe_lib/src/hard_strategy.dart';
import 'package:tic_tac_toe_lib/src/medium_startegy.dart';
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
        return EasyStrategy();
      case EStrategy.medium:
        return MediumStrategy();
      case EStrategy.hard:
        return HardStrategy();
    }
  }
  Position getMove({required Board board, EMark player = EMark.O});
}
