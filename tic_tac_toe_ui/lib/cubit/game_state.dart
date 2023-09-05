import 'package:equatable/equatable.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class GameState extends Equatable {
  late final List<List<EMark>>? board;
  late final EMark? turn;
  late final EGameState? state;
  late final Duration? xDuration;
  late final Duration? oDuration;

  GameState({this.board, this.turn, this.state, this.xDuration, this.oDuration});

  GameState copyWith({
    List<List<EMark>>? board,
    EMark? turn,
    EGameState? state,
    Duration? xDuration,
    Duration? oDuration,
  }) {
    return GameState(
      board: board ?? this.board,
      turn: turn ?? this.turn,
      state: state ?? this.state,
      xDuration: xDuration ?? this.xDuration,
      oDuration: oDuration ?? this.oDuration,
    );
  }

  @override
  List<Object?> get props => [this.board, this.turn, this.state, this.xDuration, this.oDuration];
}
