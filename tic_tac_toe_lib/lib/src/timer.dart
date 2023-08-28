// import 'dart:async';

// class Timer {
//   final xTimer = Stopwatch();
//   final oTImer = Stopwatch();
// }

// class TimerClass {
//   Stopwatch _stopwatch = Stopwatch();
//   bool _isRunning = false;
//   Duration _updateInterval;
//   Function(String) _updateCallback;

//   TimerClass({required Duration updateInterval, required Function(String) updateCallback})
//       : _updateInterval = updateInterval ?? Duration(seconds: 1),
//         _updateCallback = updateCallback {
//     _updateTime();
//   }

//   void start() {
//     if (!_isRunning) {
//       _isRunning = true;
//       _stopwatch.start();
//       _updateTime();
//     }
//   }

//   void stop() {
//     if (_isRunning) {
//       _isRunning = false;
//       _stopwatch.stop();
//     }
//   }

//   void reset() {
//     _stopwatch.reset();
//     if (_updateCallback != null) {
//       _updateCallback(getTime());
//     }
//   }

//   void _updateTime() {
//     if (_isRunning) {
//       if (_updateCallback != null) {
//         _updateCallback(getTime());
//       }
//       Timer(_updateInterval, _updateTime);
//     }
//   }

//   String getTime() {
//     int minutes = _stopwatch.elapsed.inMinutes;
//     int seconds = _stopwatch.elapsed.inSeconds % 60;
//     return '$minutes:${seconds.toString().padLeft(2, '0')}';
//   }
// }
