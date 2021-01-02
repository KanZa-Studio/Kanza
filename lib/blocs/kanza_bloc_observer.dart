import 'package:flutter_bloc/flutter_bloc.dart';

class KanzaBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    print('${cubit.runtimeType} : $change');
  }
}
