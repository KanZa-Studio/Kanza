import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/contractors/base_auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository)
      : assert(authRepository != null),
        super(AuthState.initial());

  final BaseAuthRepository authRepository;

  void initAuth() async {
    try {
      emit(AuthState.progress());
      final loggedUser = await authRepository.loggedUser();
      await Future.delayed(Duration(seconds: 2));
      emit(loggedUser != null
          ? AuthState.authenticated(loggedUser)
          : AuthState.unauthenticated());
    } on Exception {
      emit(AuthState.failure());
    }
  }

  void loggedIn(String username) => emit(AuthState.authenticated(username));
}
