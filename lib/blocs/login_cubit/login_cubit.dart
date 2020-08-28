import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../data/contractors/base_login_repository.dart';
import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/translator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository)
      : assert(loginRepository != null),
        super(LoginState.initial());

  final BaseLoginRepository loginRepository;

  void onUsernameChanged(String username) =>
      emit(state.updateUsername(username.length >= 3));

  void onContinueButtonClicked(String username) async {
    try {
      final result = await loginRepository.loginUser(username);
      emit(
          result ? LoginState.success() : LoginState.failure(loginFailed.tr()));
    } on Exception {
      emit(LoginState.failure(loginFailed.tr()));
    }
  }
}
