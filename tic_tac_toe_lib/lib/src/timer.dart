import 'dart:async';
import 'dart:html';

class TimerClass {
  final xTimer = Stopwatch();
  final oTimer = Stopwatch();
  late final VoidCallback timerNotify;
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
}
