import 'package:tic_tac_toe_lib/src/game_api/igame.dart';
import 'package:tic_tac_toe_lib/src/game_api/istrategy.dart';
import 'package:tic_tac_toe_lib/src/listener.dart';
import 'package:tic_tac_toe_lib/src/game_api/logger.dart';
//import 'package:tic_tac_toe_lib/src/timer.dart';

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
        _state = EGameState.playing {
    //_timer = TimerClass(timerNotify: notifyTimerTic);
  }

  EMark _currentPlayer;
  final Board _board;
  EGameState _state;
  IStrategy? _strategy;
  final List<IListener> _listerers = [];
  //late final TimerClass _timer;
  final _gameLogger = logger(Game);

  @override
  EMark get turn => _currentPlayer;
  @override
  EGameState get state => _state;
  @override
  bool get isGameOver => _state.isGameOver;
  @override
  bool get isStateExit => _state == EGameState.exit;
  @override
  EGameState? get gameResult => _state;
  @override
  MarkMatrix get board => _board.matrix;
  @override
  set strategy(EStrategy? val) {
    if (val != null) {
      _strategy = IStrategy(val);
    } else {
      _strategy = null;
    }
  }

  @override
  void restart() {
    // _timer.restart();
    _board.restart();
    _currentPlayer = EMark.X;
    _state = EGameState.playing;
    _gameLogger.i('Game has been restarted.');
    notifyRestart();
  }

  @override
  void makeMove(Position pos) {
    if (_state == EGameState.playing) {
      _board.makeMove(pos, _currentPlayer);
      verifyState();

      if (isGameOver) {
        return;
      }

      _currentPlayer = _currentPlayer.opposite;
      notifyMarkMade();

      if (_strategy != null && _currentPlayer != EMark.X) {
        Position pos = _strategy!.getMove(board: _board, player: _currentPlayer);

        if (!pos.isPositionValid) throw StrategyGetMoveError();

        _board.makeMove(pos, _currentPlayer);
        verifyState();
        if (isGameOver) {
          return;
        }
        _currentPlayer = _currentPlayer.opposite;

        notifyMarkMade();
      }
    }
  }

  @override
  void addListener(IListener listener) {
    _gameLogger.i('Listener added to class Game.');
    _listerers.add(listener);
  }

  @override
  void removeListener(IListener listener) {
    int index = _listerers.indexWhere((elem) => elem == listener);

    if (index != -1) {
      _gameLogger.i('Listener removed from class Game.');
      _listerers.removeAt(index);
    } else {
      // exception
    }
  }

  void notifyMarkMade() {
    for (var i = 0; i < _listerers.length; i++) {
      _gameLogger.i('Listeners notifyed of MarkMade.');
      _listerers[i].onMarkMade();
    }
  }

  void notifyGameOver() {
    for (var i = 0; i < _listerers.length; i++) {
      _gameLogger.i('Listeners notifyed of GameOver.');
      _listerers[i].onGameOver(_state);
    }
  }

  void notifyExit() {
    for (var i = 0; i < _listerers.length; i++) {
      _gameLogger.i('Listeners notifyed of Exit.');
      _listerers[i].onExit();
    }
  }

  void notifyRestart() {
    for (var i = 0; i < _listerers.length; i++) {
      _gameLogger.i('Listeners notifyed of Restart.');
      _listerers[i].onReset();
    }
  }

  void notifyTimerTic() {
    for (var i = 0; i < _listerers.length; i++) {
      _gameLogger.i('Listeners notifyed of Restart.');
      _listerers[i].onTimerTic();
    }
  }

  void verifyState() {
    if (_board.currentPlayerWon(_currentPlayer)) {
      EGameState state = _currentPlayer == EMark.O ? EGameState.oWon : EGameState.xWon;
      updateState(state);
      notifyGameOver();
      _gameLogger.i('Game state changed to $_state');
    } else if (_board.isMatrixFull()) {
      updateState(EGameState.draw);
      notifyGameOver();
      _gameLogger.i('Game state changed to $_state');
    }
  }

  void updateState(EGameState state) => _state = state;
}
