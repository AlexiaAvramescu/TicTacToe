import 'package:tic_tac_toe_lib/src/game_api/igame.dart';
import 'package:tic_tac_toe_lib/src/game_api/istrategy.dart';
//import 'package:logger/logger.dart';
import 'package:tic_tac_toe_lib/src/listener.dart';

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
  final List<IListener> _listerers = [];

  @override
  bool get isGameOver => _state.isGameOver;
  @override
  bool get isStateExit => _state == EGameState.exit;
  @override
  EGameState? get gameResult => _state;
  @override
  MarkMatrix get board => _board.matrix;
  @override
  set strategy(IStrategy value) => _strategy = value;

  @override
  void playerComand(ECommand command) {
    switch (command) {
      case ECommand.exit:
        updateState(EGameState.exit);
        notifyExit();
        break;
      case ECommand.restart:
        restart();
        notifyReset();
        break;
    }
  }

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

    if (isGameOver) {
      notifyGameOver();
      return;
    }

    _currentPlayer = _currentPlayer.opposite;
    notifyMarkMade();

    if (_strategy != null && _currentPlayer != EMark.X) {
      Position pos = _strategy!.getMove(board: _board, player: _currentPlayer);

      if (!pos.isPositionValid) throw StrategyGetMoveError();

      _board.makeMove(pos, _currentPlayer);
      verifyState();
      _currentPlayer = _currentPlayer.opposite;
      notifyMarkMade();
    }
  }

  @override
  void addListener(IListener listener) {
    _listerers.add(listener);
  }

  @override
  void removeListener(IListener listener) {
    int index = _listerers.indexWhere((elem) => elem == listener);

    if (index != -1) {
      _listerers.removeAt(index);
    } else {
      // exception
    }
  }

  void notifyMarkMade() {
    for (var i = 0; i < _listerers.length; i++) {
      _listerers[i].onMarkMade();
    }
  }

  void notifyGameOver() {
    for (var i = 0; i < _listerers.length; i++) {
      _listerers[i].onGameOver(_state);
    }
  }

  void notifyExit() {
    for (var i = 0; i < _listerers.length; i++) {
      _listerers[i].onExit();
    }
  }

  void notifyReset() {
    for (var i = 0; i < _listerers.length; i++) {
      _listerers[i].onReset();
    }
  }

  void verifyState() {
    if (_board.currentPlayerWon(_currentPlayer)) {
      EGameState state = _currentPlayer == EMark.O ? EGameState.oWon : EGameState.xWon;
      updateState(state);
      notifyGameOver();
    } else if (_board.isMatrixFull()) {
      updateState(EGameState.draw);
      notifyGameOver();
    }
  }

  void updateState(EGameState state) => _state = state;
}
