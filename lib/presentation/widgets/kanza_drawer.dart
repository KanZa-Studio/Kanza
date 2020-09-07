import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../blocs/localization_cubit/localization_cubit.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/responsive_helper.dart';
import '../../utils/extensions/theme_extension.dart';
import '../../utils/extensions/translator.dart';

class KanzaDrawer extends StatefulWidget {
  @override
  _KanzaDrawerState createState() => _KanzaDrawerState();
}

class _KanzaDrawerState extends State<KanzaDrawer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;

    return Drawer(
      child: Container(
        color: Theme.of(context).drawerBackgroundColor,
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              kanza,
              style: Theme.of(context).textTheme.headline3,
            ).tr(),
            SizedBox(height: screenHeight * 0.13),
            _drawerItem(Assets.icons.home, home.tr(), screenHeight,
                themeAware: true),
            _drawerItem(Assets.icons.drawerArchive, archives.tr(), screenHeight,
                themeAware: true),
            _drawerItem(Assets.icons.share, shareApp.tr(), screenHeight,
                themeAware: true),
            _drawerItem(Assets.icons.eng, eng.tr(), screenHeight,
                onPressed: () =>
                    context.bloc<LocalizationCubit>().changeLocale(eng)),
            _drawerItem(Assets.icons.aze, aze.tr(), screenHeight,
                onPressed: () =>
                    context.bloc<LocalizationCubit>().changeLocale(aze)),
            _drawerItem(Assets.icons.ru, ru.tr(), screenHeight,
                onPressed: () =>
                    context.bloc<LocalizationCubit>().changeLocale(ru)),
            _drawerItem(
              Assets.icons.light,
              Theme.of(context).isDark ? lightMode.tr() : darkMode.tr(),
              screenHeight,
              themeAware: true,
              onPressed: () => context
                  .bloc<ThemeCubit>()
                  .changeTheme(Theme.of(context).isDark ? false : true),
            ),
            Expanded(child: SizedBox()),
            _drawerItem(null, about.tr(), screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(String iconPath, String title, double screenHeight,
      {bool themeAware = false, VoidCallback onPressed}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor.withOpacity(.2),
        onTap: onPressed?.call,
        child: Container(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: screenHeight * 0.017,
            top: screenHeight * 0.017,
          ),
          child: Row(
            children: [
              iconPath != null
                  ? SvgPicture.asset(
                      iconPath,
                      color: themeAware
                          ? Theme.of(context).drawerItemIconColor
                          : null,
                    )
                  : SizedBox(),
              Visibility(
                visible: iconPath != null,
                child: const SizedBox(width: 14.0),
              ),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).drawerItemTextColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
