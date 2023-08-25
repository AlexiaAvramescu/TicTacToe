import 'dart:html';
import 'dart:mirrors';

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

      verify(console.onMarkMade()).called(1);
    });
    test('OnGameOver Test', () {});
    test('OnRestart Test', () {
      game.playerComand(ECommand.restart);

      verify(console.onReset()).called(1);
    });
    test('OnExit Test', () {
      game.playerComand(ECommand.exit);
      game.playerComand(ECommand.exit);
      game.playerComand(ECommand.exit);

      verify(console.onExit()).called(3);
    });
  });
}
