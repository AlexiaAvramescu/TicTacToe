import 'dart:async';

class TimerClass {
  final xTimer = Stopwatch();
  final oTimer = Stopwatch();
  late final void Function() timerNotify;
  late final Timer timer;

  TimerClass({required this.timerNotify}) {
    timer = Timer(Duration(milliseconds: 10), () {
      timerNotify();
    });
  }

  void restart() {
    xTimer.reset();
    oTimer.reset();
  }

  void switchTimer() {
    if (xTimer.isRunning) {
      xTimer.stop();
      oTimer.start();
    } else {
      xTimer.start();
      oTimer.stop();
    }
  }

  bool isRunning() => xTimer.isRunning || oTimer.isRunning ? true : false;
}
