import 'dart:io';

import 'package:logger/logger.dart';

Logger loggerType(Type type) => Logger(
    printer: CustomPrinter(type.toString()),
    output: SaveToFile(filePath: 'C:/Users/aavramescu/Desktop/XOGame/tic_tac_toe_lib/lib/logger.txt'));

final logger = (Type type) => loggerType(type);

class CustomPrinter extends LogPrinter {
  final String className;

  CustomPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final message = event.message;

    return ['$emoji $className: $message'];
  }
}

class SaveToFile extends LogOutput {
  late final String filePath;
  late final File file;

  SaveToFile({required this.filePath}) {
    file = File(filePath);
    file.writeAsStringSync('', mode: FileMode.write);
  }

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      file.writeAsStringSync(line, mode: FileMode.append);
      file.writeAsStringSync('\n', mode: FileMode.append);
    }
  }
}
