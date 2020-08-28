import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './my_scroll_behavior.dart';
import './presentation/pages/splash/splash_page.dart';
import './presentation/values/themes.dart';
import './utils/localization_helper/localization_helper.dart';
import './blocs/category_cubit/category_cubit.dart';
import './data/repositories/category_repository.dart';
import './data/services/database_service.dart';
import './data/repositories/auth_repository.dart';
import './blocs/auth_cubit/auth_cubit.dart';

class KanzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => AuthRepository()),
        RepositoryProvider<CategoryRepository>(
          create: (_) => CategoryRepository(KanzaDatabase()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              context.repository<AuthRepository>(),
            )..initAuth(),
          ),
          BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(
              categoryRepository: context.repository<CategoryRepository>(),
            )..fetchAllCategories(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: defaultTheme,
          locale: const Locale('en', 'US'),
          supportedLocales: [
            Locale('en', 'US'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehaviour(),
              child: child,
            );
          },
          home: SplashPage(),
        ),
      ),
    );
  }
}
