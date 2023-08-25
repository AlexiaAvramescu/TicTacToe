import 'dart:io';

import 'package:logger/logger.dart';

Logger loggerType(Type type) => Logger(
    printer: CustomPrinter(type.toString()),
    output: FileOutput(file: File('tic_tac_toe_lib/lib/logger.txt'), overrideExisting: true));

final logger = (Type type) => loggerType(type);

class CustomPrinter extends LogPrinter {
  final String className;

  CustomPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final emoji = PrettyPrinter.defaultLevelEmojis;
    final message = event.message;

    return [('$emoji: $message')];
  }
}
