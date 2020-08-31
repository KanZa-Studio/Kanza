import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../../../utils/constants/language_keys.dart';
import '../../../../utils/extensions/translator.dart';

class TopBar extends StatelessWidget {
  const TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 60,
            offset: const Offset(0.0, 4.0),
            color: LightThemeColor.topBarShadowColor,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.menu, color: Theme.of(context).primaryColor),
          Expanded(
            child: Center(
              child: Text(
                kanza,
                style: Theme.of(context).textTheme.headline6,
              ).tr(),
            ),
          ),
        ],
      ),
    );
  }
}
