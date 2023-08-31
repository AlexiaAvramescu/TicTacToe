import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe_lib/src/game_api/igame.dart';
import 'package:tic_tac_toe_lib/src/game_api/position.dart';
import 'package:tic_tac_toe_lib/src/listener.dart';

class IListenerMock extends Mock implements IListener {}

void main() {
  group('Game', () {
    late IGame game;
    late IListenerMock console;

    setUp(() {
      console = IListenerMock();
      game = IGame();
      game.addListener(console);
    });

    test('OnMadeMove Test', () {
      game.makeMove(Position(1, 1));
      game.makeMove(Position(2, 0));
      game.makeMove(Position(0, 0));
      game.makeMove(Position(2, 1));

      verify(console.onMarkMade()).called(4);
    });
    test('OnGameOver Test', () {
      game.makeMove(Position(1, 1));
      game.makeMove(Position(2, 0));
      game.makeMove(Position(0, 0));
      game.makeMove(Position(2, 1));
      game.makeMove(Position(2, 2));

      verify(console.onGameOver(EGameState.xWon)).called(1);
    });
    test('OnRestart Test', () {
      game.restart();

      verify(console.onReset()).called(1);
    });
  });
}
