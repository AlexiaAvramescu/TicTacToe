import 'package:tic_tac_toe_lib/src/game_api/igame.dart';
import 'package:tic_tac_toe_lib/src/game_api/istrategy.dart';
import 'package:tic_tac_toe_lib/src/listener.dart';
import 'package:tic_tac_toe_lib/src/game_api/logger.dart';
import 'package:tic_tac_toe_lib/src/timer.dart';

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
        _state = EGameState.strategyNotSet {
    _timer = TimerClass(timerNotify: notifyTimerTic, handleTimeout: handleTimeout);
  }

  EMark _currentPlayer;
  final Board _board;
  EGameState _state;
  IStrategy? _strategy;
  final List<IListener> _listerers = [];
  late final TimerClass _timer;
  final _gameLogger = logger(Game);

  @override
  EMark get turn => _currentPlayer;
  @override
  EGameState get state => _state;
  @override
  bool get isGameOver => _state.isGameOver;
  @override
  EGameState? get gameResult => _state;
  @override
  MarkMatrix get board => _board.matrix;

  @override
  set strategy(EStrategy? val) {
    if (val != null) {
      _strategy = IStrategy(val);
      _gameLogger.i('Strategy set to ${val.name}.');
      _timer.reset();
    } else {
      _strategy = null;
      _gameLogger.i('Strategy set to null.');
      _timer.reset();
      _timer.start();
    }
    updateState(EGameState.playing);
  }

  @override
  void restart() {
    _timer.reset();
    if (_strategy == null) _timer.start();
    _board.restart();
    _currentPlayer = EMark.X;
    _state = EGameState.playing;
    _gameLogger.i('Game has been restarted.');
    notifyRestart();
  }

  @override
  void makeMove(Position pos) {
    if (_state != EGameState.playing) {
      _gameLogger.w('makeMove() called in other state then playing');
      throw NotStatePlaying();
    }
    _board.makeMove(pos, _currentPlayer);
    verifyState();

    if (isGameOver) {
      return;
    }
    _currentPlayer = _currentPlayer.opposite;
    notifyMarkMade();

    if (_strategy != null) {
      Position pos = _strategy!.getMove(board: _board, player: _currentPlayer);

      if (!pos.isPositionValid) throw StrategyGetMoveError();

      _board.makeMove(pos, _currentPlayer);
      verifyState();

      if (isGameOver) {
        return;
      }
      _currentPlayer = _currentPlayer.opposite;
      notifyMarkMade();
    } else {
      _timer.switchTimer();
      _gameLogger.i('Timer switched to ${_currentPlayer.name}.');
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
      _gameLogger.w('Listener not found to be removed from class Game.');
      throw ListenerCanNotBeRemoved();
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

  void notifyRestart() {
    for (var i = 0; i < _listerers.length; i++) {
      _gameLogger.i('Listeners notifyed of Restart.');
      _listerers[i].onReset();
    }
  }

  void notifyTimerTic() {
    for (var i = 0; i < _listerers.length; i++) {
      _listerers[i].onTimerTic(_timer.xTimer.elapsed, _timer.oTimer.elapsed);
    }
  }

  void verifyState() {
    if (_board.currentPlayerWon(_currentPlayer)) {
      EGameState state = _currentPlayer == EMark.O ? EGameState.oWon : EGameState.xWon;
      updateState(state);
      _timer.reset();
      notifyGameOver();
    } else if (_board.isMatrixFull()) {
      updateState(EGameState.draw);
      _timer.reset();
      notifyGameOver();
    }
  }

  void updateState(EGameState state) {
    _state = state;
    _gameLogger.i('Game state changed to $_state');
  }

  void handleTimeout() {
    if (_timer.xTimer.elapsed.inSeconds >= 20) {
      updateState(EGameState.oWon);
      _timer.reset();
      notifyGameOver();
    }
    if (_timer.oTimer.elapsed.inSeconds >= 20) {
      updateState(EGameState.xWon);
      _timer.reset();
      notifyGameOver();
    }
  }

  bool isTimerRunning() => _timer.isRunning();
}
