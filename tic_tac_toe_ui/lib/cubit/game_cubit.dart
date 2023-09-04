import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
import 'package:tic_tac_toe_ui/cubit/game_state.dart';

class GameCubit extends Cubit<GameState> implements IListener {
  late final IGame game = IGame();

  GameCubit() : super(GameState()) {
    game.addListener(this);
  }

  void setStrategy(EStrategy? val) {
    game.strategy = val;
  }

  void restart() {
    game.restart();
  }

  void makeMove(Position pos) {
    try {
      game.makeMove(pos);
    } on InvalidInputException catch (e) {
      print(e.message);
    } on StrategyGetMoveError catch (e) {
      print(e.message);
    }
  }

  @override
  void onExit() {
    emit(GameState(board: game.board, turn: game.turn, state: game.state));
  }

  @override
  void onGameOver(EGameState state) {
    emit(GameState(board: game.board, turn: game.turn, state: game.state));
  }

  @override
  void onMarkMade() {
    emit(GameState(board: game.board, turn: game.turn, state: game.state));
  }

  @override
  void onReset() {
    emit(GameState(board: game.board, turn: game.turn, state: game.state));
  }

  @override
  void onTimerTic(int elapsedTime) {
    // timer
    emit(GameState(board: game.board, turn: game.turn, state: game.state, timer: elapsedTime));
  }
}
