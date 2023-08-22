import 'package:tic_tac_toe_lib/src/tic_tac_toe_api.dart';
import 'tic_tac_toe_exception.dart';
import 'position_class.dart';
import 'board_class.dart';

class Game implements IGame {
  Game({this.turn = ETurn.O});

  ETurn turn;
  late final Board board;
  final EGameResult? result = null; // problem

  @override
  bool get isGameOver => result == null ? false : true;
  @override
  EGameResult? get getGameResult => result;
  @override
  List<List<String?>> get getBoard => board.matrix;

  @override
  bool isInputValid(Position pos) {
    if (!pos.isPositionValid) {
      InvalidInputException();
    }

    if (board.matrix[pos.x][pos.y] != null) {
      InvalidInputException();
    }

    return true;
  }

  @override
  void makeMove(Position pos) {
    board.makeMove(pos, turn);
    turn = turn == ETurn.O ? ETurn.X : ETurn.O;
  }
}


