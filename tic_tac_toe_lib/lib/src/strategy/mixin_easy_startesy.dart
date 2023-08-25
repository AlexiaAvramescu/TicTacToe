import 'dart:math';

import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

mixin EasyGetMove {
  Position easyGetMove({required Board board, EMark player = EMark.O}) {
    List<Position> freePositions = [];

    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board.matrix[i][j].isEmpty) freePositions.add(Position(i, j));
      }
    }

    Random random = Random();
    int randomIndex = random.nextInt(freePositions.length);
    return freePositions[randomIndex];
  }
}
