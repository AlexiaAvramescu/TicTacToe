import 'package:tic_tac_toe_lib/src/game_api/igame.dart';

abstract class IListener {
  void onMarkMade();
  void onGameOver(EGameState val);
  void onExit();
  void onReset();
}
