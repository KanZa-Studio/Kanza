import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';
import '../home/home_page.dart';
import '../../values/colors.dart';
import '../../../blocs/login_cubit/login_cubit.dart';
import '../../../blocs/auth_cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (_, curr) =>
            curr.loginStatus == LoginStatus.success ||
            curr.loginStatus == LoginStatus.failure,
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.success) {
            /// calls [AuthCubit] to authenticate [user]
            /// and [username] will be shown
            context.bloc<AuthCubit>().loggedIn(usernameController.text);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                (route) => false);
          } else if (state.loginStatus == LoginStatus.failure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Row(
                    children: [Text(state.message)],
                  ),
                ),
              );
          }
        },
        builder: (context, state) {
          return IntrinsicWidth(
            stepWidth: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      welcomeToKanza,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ).tr(),
                    const SizedBox(height: 8),
                    Text(
                      kanzaDescription,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ).tr(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 72,
                        right: 72,
                        top: 54,
                        bottom: 28,
                      ),
                      child: TextField(
                        controller: usernameController,
                        autofocus: false,
                        onChanged: (value) =>
                            context.bloc<LoginCubit>().onUsernameChanged(value),
                        decoration: InputDecoration(
                          hintText: username.tr(),
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: textFieldHintColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: state.isUsernameValid
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(26),
                      child: InkWell(
                        onTap: state.isUsernameValid
                            ? () => context
                                .bloc<LoginCubit>()
                                .onContinueButtonClicked(
                                    usernameController.text.trim())
                            : null,
                        borderRadius: BorderRadius.circular(26),
                        child: SizedBox(
                          width: 144,
                          height: 42,
                          child: Center(
                            child: Text(
                              continueLogin,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ).tr(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    usernameController?.dispose();
    super.dispose();
  }
}
