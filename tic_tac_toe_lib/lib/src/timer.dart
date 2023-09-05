import 'dart:async';

import 'package:tic_tac_toe_lib/src/game_api/igame.dart';

class TimerClass {
  final xStopwatch = Stopwatch();
  final oStopwatch = Stopwatch();
  late final void Function() timerNotify;
  late final void Function() handleTimeout;
  late Timer timer;

  TimerClass({required this.timerNotify, required this.handleTimeout}) {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      timerNotify();
      if (xStopwatch.elapsed.inSeconds >= 20 || oStopwatch.elapsed.inSeconds >= 20) handleTimeout();
    });
  }

  void reset() {
    xStopwatch.reset();
    oStopwatch.reset();

    pause();
  }

  void switchTimer() {
    if (xStopwatch.isRunning) {
      xStopwatch.stop();
      oStopwatch.start();
    } else {
      xStopwatch.start();
      oStopwatch.stop();
    }
  }

  void start(EMark player) {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      timerNotify();
      if (xStopwatch.elapsed.inSeconds >= 20 || oStopwatch.elapsed.inSeconds >= 20) handleTimeout();
    });

    if (player == EMark.X)
      xStopwatch.start();
    else
      oStopwatch.start();
  }

  void pause() {
    if (xStopwatch.isRunning) xStopwatch.stop();
    if (oStopwatch.isRunning) oStopwatch.stop();
    timer.cancel();
  }

  bool isRunning() => xStopwatch.isRunning || oStopwatch.isRunning ? true : false;
}
