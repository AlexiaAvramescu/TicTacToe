import 'dart:async';

class TimerClass {
  final xStopwatch = Stopwatch();
  final oStopwatch = Stopwatch();
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
    xStopwatch.reset();
    oStopwatch.reset();

    xStopwatch.stop();
    oStopwatch.stop();

    timer.cancel();
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

  void start() {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      timerNotify();
      if (xStopwatch.elapsed.inSeconds >= 20 || oStopwatch.elapsed.inSeconds >= 20) handleTimeout();
    });
    xStopwatch.start();
  }

  bool isRunning() => xStopwatch.isRunning || oStopwatch.isRunning ? true : false;
}
