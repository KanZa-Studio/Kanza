import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

class LoggerService {
  LoggerService._();

  static void init() {
    ansiColorDisabled = false;
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_onLogReceived);
  }

  static final _colors = <Level, AnsiPen>{
    Level.ALL: AnsiPen(),
    Level.FINEST: AnsiPen()..blue(),
    Level.FINER: AnsiPen()..green(),
    Level.FINE: AnsiPen()..green(),
    Level.INFO: AnsiPen()..green(),
    Level.CONFIG: AnsiPen()..green(),
    Level.WARNING: AnsiPen()..yellow(),
    Level.SEVERE: AnsiPen()..magenta(),
    Level.SHOUT: AnsiPen()..red(),
  };

  static void _onLogReceived(LogRecord record) {
    final pen = _colors.containsKey(record.level)
        ? _colors[record.level]
        : _colors[Level.ALL];

    debugPrint(
      pen('${record.level}: ${record.loggerName} => ${record.message}'),
    );
  }
}
