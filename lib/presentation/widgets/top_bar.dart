import 'package:flutter/material.dart';

import '../../utils/extensions/theme_extension.dart';
import '../values/colors.dart';

class TopBar extends StatelessWidget {
  TopBar({
    @required this.title,
    this.leadingIcon,
    this.centerTitle = true,
    this.onPressed,
  });

  final bool centerTitle;
  final String title;
  final IconData leadingIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
          InkWell(
            onTap: () => onPressed != null
                ? onPressed.call()
                : Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
              child: Icon(
                leadingIcon ?? Icons.menu,
                color: Theme.of(context).topBarDrawerOpenerColor,
              ),
            ),
          ),
          Expanded(
            child: centerTitle
                ? Center(
                    child: _titleWidget(context),
                  )
                : _titleWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _titleWidget(BuildContext context) => Text(
        title,
        style: Theme.of(context).textTheme.headline6.copyWith(
            color: Theme.of(context).isDark
                ? null
                : Theme.of(context).primaryColor),
      );
}
