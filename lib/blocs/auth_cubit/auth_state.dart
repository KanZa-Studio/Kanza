part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated, initial, progress, failure }

class AuthState extends Equatable {
  const AuthState._({this.authStatus = AuthStatus.initial, this.username});

  const AuthState.initial() : this._();

  const AuthState.authenticated(String username)
      : this._(authStatus: AuthStatus.authenticated, username: username);

  const AuthState.unauthenticated()
      : this._(authStatus: AuthStatus.unauthenticated);

  const AuthState.progress() : this._(authStatus: AuthStatus.progress);

  const AuthState.failure() : this._(authStatus: AuthStatus.failure);

  final AuthStatus authStatus;
  final String username;

  @override
  List<Object> get props => [authStatus];
}
