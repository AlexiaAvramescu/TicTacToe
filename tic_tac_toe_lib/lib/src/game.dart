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

  @override
  void makeMove(Position pos) {
    _board.makeMove(pos, _currentPlayer);
    verifyState();

    if (isGameOver) return;

    _currentPlayer = _currentPlayer.opposite;

    if (_strategy != null && _currentPlayer != EMark.X) {
      Position pos = _strategy!.getMove(board: _board, player: _currentPlayer);

      if (!pos.isPositionValid) throw StrategyGetMoveError();

      _board.makeMove(pos, _currentPlayer);
      verifyState();
      _currentPlayer = _currentPlayer.opposite;
    }
  }

  void verifyState() {
    if (_board.currentPlayerWon(_currentPlayer)) {
      EGameState state =
          _currentPlayer == EMark.O ? EGameState.oWon : EGameState.xWon;
      updateState(state);
    } else if (_board.isMatrixFull()) {
      updateState(EGameState.draw);
    }
  }

  void updateState(EGameState state) => _state = state;
}
