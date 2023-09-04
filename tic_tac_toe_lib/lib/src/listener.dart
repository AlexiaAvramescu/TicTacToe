import 'package:tic_tac_toe_lib/src/game_api/igame.dart';

abstract class IListener {
  void onMarkMade();
  void onGameOver(EGameState state);
  void onExit();
  void onReset();
  void onTimerTic(Duration xDuration, Duration oDuration);
}
