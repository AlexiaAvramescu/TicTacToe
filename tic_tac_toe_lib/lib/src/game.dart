import 'package:tic_tac_toe_lib/src/game_api/igame.dart';
import 'package:tic_tac_toe_lib/src/istrategy.dart';
import 'game_api/game_exception.dart';
import 'game_api/position.dart';
import 'board.dart';

class Game implements IGame {
  Game(
      {ETurn turn = ETurn.X,
      List<List<String>> boardConfig = const [
        ['-', '-', '-'],
        ['-', '-', '-'],
        ['-', '-', '-']
      ]})
      : _turn = turn,
        _board = Board(matrixConfig: boardConfig);

  ETurn _turn;
  final Board _board;
  EGameResult? _result;
  IStrategy? _strategy;

  @override
  bool get isGameOver => _result == null ? false : true;
  @override
  EGameResult? get gameResult => _result;
  @override
  List<List<String?>> get board => _board.matrix;
  @override
  set strategy(IStrategy value) => _strategy = value;

  void isInputValid(Position pos) {
    if (!pos.isPositionValid) {
      throw OutOfBoundInputException();
    }

    if (_board.matrix[pos.x][pos.y] != '-') {
      throw OccupiedPositionException();
    }
  }

  @override
  void makeMove(Position pos) {
    isInputValid(pos);
    _board.makeMove(pos, _turn);

    if (_board.currentPlayerWon(_turn)) {
      _result = _turn == ETurn.O ? EGameResult.oWon : EGameResult.xWon;
    } else if (_board.isMatrixFull()) {
      _result = EGameResult.draw;
    }

    

    _turn = _turn == ETurn.O ? ETurn.X : ETurn.O;
  }
}
