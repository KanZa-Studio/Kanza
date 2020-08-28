import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/login_page.dart';
import '../home/home_page.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';
import '../../../blocs/auth_cubit/auth_cubit.dart';
import '../../../blocs/login_cubit/login_cubit.dart';
import '../../../data/repositories/login_repository.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
            (route) => false,
          );
        } else if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => RepositoryProvider<LoginRepository>(
                create: (_) => LoginRepository(),
                child: BlocProvider<LoginCubit>(
                  create: (context) => LoginCubit(
                    context.repository<LoginRepository>(),
                  ),
                  child: LoginPage(),
                ),
              ),
            ),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Text(
            kanza,
            style: Theme.of(context).textTheme.headline2,
          ).tr(),
        ),
      ),
    );
  }
}
