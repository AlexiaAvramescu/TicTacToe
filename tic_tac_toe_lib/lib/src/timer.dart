import 'dart:async';

class TimerClass {
  final xTimer = Stopwatch();
  final oTimer = Stopwatch();
  late final void Function() timerNotify;
  late final void Function() handleTimeout;
  late Timer timer;

  TimerClass({required this.timerNotify, required this.handleTimeout}) {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      timerNotify();
      handleTimeout();
    });
  }

  void reset() {
    xTimer.reset();
    oTimer.reset();

    xTimer.stop();
    oTimer.stop();

    timer.cancel();
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

  void start() {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      timerNotify();
      handleTimeout();
    });
    xTimer.start();
  }

  bool isRunning() => xTimer.isRunning || oTimer.isRunning ? true : false;
}
