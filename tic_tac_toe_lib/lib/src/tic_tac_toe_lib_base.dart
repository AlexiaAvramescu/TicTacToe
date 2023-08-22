import 'package:tic_tac_toe_lib/src/tic_tac_toe_api.dart';

class Game implements IGame {
  Game({this.turn = ETurn.O});

  ETurn turn;
  late final Board board;
  final EGameResult? result = null;

  @override
  bool get isGameOver => result == null ? false : true;
  @override
  EGameResult? get getGameResult => result;
  @override
  List<List<String?>> get getBoard => board.getMatrix;

  @override
  bool isInputValid(Position pos) {
    if(!pos.isPositionValid){
      return false;
      // exception
    }

    if(board.matrix[pos.x][pos.y] != null){
      return false;
      //exception
    }

    return true;
  }
  @override
  void makeMove(Position pos) {
    board.matrix[pos.x][pos.y] = turn.name;

    turn = turn == ETurn.O ? ETurn.X : ETurn.O;
  }
}

class Board {
  Board() {
    final list = List.filled(3, null);
    matrix = List.filled(3, list);
  }

  List<List<String?>> get getMatrix => matrix;

  late final List<List<String?>> matrix;
}

class Position {
  Position(this.x, this.y);

  final int x;
  final int y;

  bool get isPositionValid => x >= 0 && x <= 2 && y >= 0 && y <= 2;

  @override
  String toString() => 'Position($x, $y)';
}
