import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/services/shared_preferences_service.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/extensions/responsive_helper.dart';

class WelcomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;

    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.welcome,
            width: width * 0.79,
            height: height * 0.26,
            fit: BoxFit.contain,
          ),
          SizedBox(height: height * 0.06),
          Material(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(54),
            child: InkWell(
              borderRadius: BorderRadius.circular(54),
              onTap: () async {
                (await SharedPreferencesService.instance).setUserLogged();
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 46),
                child: Text(
                  AppLocalizations.of(context).continue_login,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
