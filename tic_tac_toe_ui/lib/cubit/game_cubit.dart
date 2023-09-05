import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
import 'package:tic_tac_toe_ui/cubit/game_state.dart';

class GameCubit extends Cubit<GameState> implements IListener {
  late IGame _game = IGame();

  GameCubit() : super(GameState()) {
    _game.addListener(this);
  }

  set game(IGame game) {
    _game.removeListener(this);
    _game = game;
    _game.addListener(this);
  }

  set strategy(EStrategy? val) => _game.strategy = val;

  void restart() {
    _game.restart();
  }

  void makeMove(Position pos) {
    try {
      _game.makeMove(pos);
    } on InvalidInputException catch (e) {
      print(e.message);
    } on StrategyGetMoveError catch (e) {
      print(e.message);
    }
  }

  void pauseTimer() {
    _game.pauseTimer();
  }

  void resumeTimer() {
    _game.resumeTimer();
  }

  @override
  void onGameOver(EGameState gameState) {
    emit(state.copyWith(state: gameState));
  }

  @override
  void onMarkMade() {
    emit(state.copyWith(board: _game.board, turn: _game.turn));
  }

  @override
  void onReset() {
    emit(state.copyWith(board: _game.board, turn: _game.turn, state: _game.state));
  }

  @override
  void onTimerTic(Duration xDuration, Duration oDuration) {
    emit(state.copyWith(xDuration: xDuration, oDuration: oDuration));
  }
}
