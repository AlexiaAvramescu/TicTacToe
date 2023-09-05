import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
import 'package:tic_tac_toe_ui/cubit/game_cubit.dart';
import 'package:tic_tac_toe_ui/cubit/game_state.dart';

@GenerateNiceMocks([MockSpec<IGame>()])
import 'game_cubit_test.mocks.dart';

void main() {
  group('GameCubit', () {
    final MockIGame mockGame = MockIGame();

    // test('Initial state test', () {

    //   expect(gameCubit.state, equals(GameState()));
    // });

    blocTest<GameCubit, GameState>(
      'Test initialization.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;

        expect(cubit.state, equals(GameState()));
      },
      expect: () => [],
    );

    blocTest<GameCubit, GameState>(
      'Test function set strategy.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;

        cubit.strategy = EStrategy.easy;
        verify(mockGame.strategy = EStrategy.easy).called(1);
      },
      expect: () => [],
    );
    blocTest<GameCubit, GameState>(
      'Test function makeMove.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;
        cubit.makeMove(Position(0, 0));
        cubit.makeMove(Position(1, 2));
        cubit.makeMove(Position(1, 1));

        verify(mockGame.makeMove(any)).called(3);
      },
      expect: () => [],
    );

    blocTest<GameCubit, GameState>(
      'Test function restart.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;
        cubit.restart();
        verify(mockGame.restart()).called(1);
      },
      expect: () => [],
    );

    blocTest<GameCubit, GameState>(
      'Test function onReset.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;

        when(mockGame.board).thenReturn([
          [EMark.empty, EMark.empty, EMark.empty],
          [EMark.empty, EMark.empty, EMark.empty],
          [EMark.empty, EMark.empty, EMark.empty]
        ]);
        when(mockGame.state).thenReturn(EGameState.playing);
        when(mockGame.turn).thenReturn(EMark.X);

        cubit.onReset();
      },
      expect: () => [
        GameState(
          board: [
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty],
            [EMark.empty, EMark.empty, EMark.empty]
          ],
          state: EGameState.playing,
          turn: EMark.X,
        ),
      ],
    );

    blocTest<GameCubit, GameState>(
      'Test function onGameOver.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;

        cubit.onGameOver(EGameState.xWon);
      },
      expect: () => [
        GameState(
          state: EGameState.xWon,
        )
      ],
    );

    blocTest<GameCubit, GameState>(
      'Test function onTimerTic.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;

        cubit.onTimerTic(Duration(seconds: 5), Duration(seconds: 7));
      },
      expect: () => [GameState(xDuration: Duration(seconds: 5), oDuration: Duration(seconds: 7))],
    );

    blocTest<GameCubit, GameState>(
      'Test function onTimerTic #1.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;

        cubit.onTimerTic(Duration(seconds: 2), Duration(milliseconds: 7));
      },
      expect: () => [GameState(xDuration: Duration(seconds: 2), oDuration: Duration(milliseconds: 7))],
    );

    blocTest<GameCubit, GameState>(
      'Test function onMoveMade.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;

        when(mockGame.board).thenReturn([
          [EMark.X, EMark.O, EMark.X],
          [EMark.empty, EMark.X, EMark.empty],
          [EMark.O, EMark.empty, EMark.empty]
        ]);
        when(mockGame.turn).thenReturn(EMark.O);

        cubit.onMarkMade();
      },
      expect: () => [
        GameState(
          board: [
            [EMark.X, EMark.O, EMark.X],
            [EMark.empty, EMark.X, EMark.empty],
            [EMark.O, EMark.empty, EMark.empty]
          ],
          turn: EMark.O,
        )
      ],
    );
  });
}
