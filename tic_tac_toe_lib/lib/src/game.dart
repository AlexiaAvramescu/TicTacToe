import 'package:tic_tac_toe_lib/src/game_api/igame.dart';
import 'package:tic_tac_toe_lib/src/game_api/istrategy.dart';
import 'game_api/game_exception.dart';
import 'game_api/position.dart';
import 'board.dart';

class Game implements IGame {
  Game(
      {EMark currentPlayer = EMark.X,
      List<List<String>> boardConfig = const [
        ['-', '-', '-'],
        ['-', '-', '-'],
        ['-', '-', '-']
      ]})
      : _currentPlayer = currentPlayer,
        _board = Board(matrixConfig: boardConfig),
        _state = EGameState.playing;

  EMark _currentPlayer;
  final Board _board;
  EGameState _state;
  IStrategy? _strategy;

  @override
  bool get isGameOver => _state.isGameOver;
  @override
  EGameState? get gameResult => _state;
  @override
  MarkMatrix get board => _board.matrix;
  @override
  set strategy(IStrategy value) => _strategy = value;

  @override
  void restart() {
    _board.restart();
    _currentPlayer = EMark.X;
    _state = EGameState.playing;
  }

  void validateInput(Position pos) {
    if (!pos.isPositionValid) throw OutOfBoundInputException();

    if (_board.matrix[pos.x][pos.y] != EMark.empty)
      throw OccupiedPositionException();
  }

  @override
  void makeMove(Position pos) {
    validateInput(pos);
    _board.makeMove(pos, _currentPlayer);

    if (_board.currentPlayerWon(_currentPlayer)) {
      _state = _currentPlayer == EMark.O ? EGameState.oWon : EGameState.xWon;
    } else if (_board.isMatrixFull()) {
      _state = EGameState.draw;
    }

    _currentPlayer = _currentPlayer.opposite;

    if (_strategy != null && _currentPlayer != EMark.X) {
      Position pos = _strategy!.getMove(_board, _currentPlayer);

      if (!pos.isPositionValid) throw StrategyGetMoveError();

      validateInput(pos);
      _board.makeMove(pos, _currentPlayer);

      if (_board.currentPlayerWon(_currentPlayer)) {
        _state = _currentPlayer == EMark.O ? EGameState.oWon : EGameState.xWon;
      } else if (_board.isMatrixFull()) {
        _state = EGameState.draw;
      }
      _currentPlayer = _currentPlayer.opposite;
    }
  }
}
