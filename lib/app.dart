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
import './blocs/category_operations_cubit/category_operations_cubit.dart';

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
          BlocProvider<CategoryOperationsCubit>(
            create: (context) => CategoryOperationsCubit(
                context.repository<CategoryRepository>()),
          ),
          BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(
              categoryRepository: context.repository<CategoryRepository>(),
            )..fetchAllCategories(),
          ),
        ],
        child: MaterialApp(
          title: 'Kanza',
          debugShowCheckedModeBanner: false,
          theme: defaultTheme,
          locale: const Locale('az', 'AZ'),
          supportedLocales: [
            Locale('en', 'US'),
            Locale('az', 'AZ'),
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
