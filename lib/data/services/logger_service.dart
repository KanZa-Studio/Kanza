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
    Level.FINEST: AnsiPen()..magenta(),
    Level.FINER: AnsiPen()..green(),
    Level.FINE: AnsiPen()..blue(),
    Level.INFO: AnsiPen()..gray(),
    Level.CONFIG: AnsiPen()..cyan(),
    Level.WARNING: AnsiPen()..red(),
    Level.SEVERE: AnsiPen()..red(),
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
