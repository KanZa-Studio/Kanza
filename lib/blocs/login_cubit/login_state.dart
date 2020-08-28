part of 'login_cubit.dart';

enum LoginStatus { initial, success, failure }

@immutable
class LoginState {
  const LoginState._({
    this.isUsernameValid = false,
    this.loginStatus = LoginStatus.initial,
    this.message,
  });

  final bool isUsernameValid;
  final LoginStatus loginStatus;
  final String message;

  const LoginState.initial() : this._();

  const LoginState.success()
      : this._(isUsernameValid: true, loginStatus: LoginStatus.success);

  const LoginState.failure(String message)
      : this._(
            isUsernameValid: true,
            loginStatus: LoginStatus.failure,
            message: message);

  LoginState updateUsername(bool isUsernameValid) =>
      LoginState._(isUsernameValid: isUsernameValid ?? this.isUsernameValid);
}
