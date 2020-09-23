import 'package:flutter/material.dart';
import 'package:kanza/presentation/values/colors.dart';
import '../../../../utils/extensions/theme_extension.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).fabButtonColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 4.0),
            color: Theme.of(context).fabButtonShadowColor,
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.add,
          size: 35,
          color: Theme.of(context).isDark
              ? DarkThemeColor.kKanzaTitleTextColor
              : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
