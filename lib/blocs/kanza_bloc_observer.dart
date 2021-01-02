import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class KanzaBlocObserver extends BlocObserver {
  final _logger = Logger('KanzaBlocObserver');

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    _logger.finest('${cubit.runtimeType} : $change');
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    _logger.finest('${bloc.runtimeType} : $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.finest('${bloc.runtimeType} : $transition');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    _logger.severe('${cubit.runtimeType} : ($error => $stackTrace)');
  }
}
