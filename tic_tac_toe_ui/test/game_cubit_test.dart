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
    late final MockIGame mockGame;
    late GameCubit gameCubit;

    setUp(() {
      gameCubit = GameCubit();
      mockGame = MockIGame();
      gameCubit.game = mockGame;
    });

    tearDown(() => gameCubit.close());

    test('Initial state test', () {
      expect(gameCubit.state, equals(GameState()));
    });

    test('Set strategy updates state', () {
      final newState = GameState(
        board: [
          [EMark.X, EMark.empty, EMark.empty],
          [EMark.empty, EMark.empty, EMark.empty],
          [EMark.empty, EMark.empty, EMark.empty]
        ],
        turn: EMark.O,
        state: EGameState.playing,
      );

      gameCubit.makeMove(Position(0, 0));
      gameCubit.strategy = null;

      expect(gameCubit.state, newState);
    });

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
        cubit.restart();
        verify(mockGame.restart()).called(1);
      },
      expect: () => [],
    );

    blocTest<GameCubit, GameState>(
      'Test function onTimerTic.',
      build: () => GameCubit(),
      act: (cubit) {
        cubit.game = mockGame;
        cubit.restart();
        verify(mockGame.restart()).called(1);
      },
      expect: () => [],
    );
  });
}
