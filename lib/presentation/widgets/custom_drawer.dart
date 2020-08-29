import 'package:flutter/material.dart';

import '../../utils/extensions/responsive_helper.dart';
import '../values/colors.dart';
import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/translator.dart';
import '../../utils/constants/routes.dart' as Routes;

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          width: context.screenWidth * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.07),
              Center(
                child: Text(
                  kanza,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ).tr(),
              ),
              SizedBox(height: context.screenHeight * 0.13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildItem(context, home, isSelected: true),
                    _buildItem(context, editCategories,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.editCategory)),
                    _buildItem(context, archives,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.archives)),
                    _buildItem(context, shareApp),
                    Spacer(),
                    _buildItem(context, about,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.about)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String title, {
    bool isSelected = false,
    VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).primaryColorLight,
        onTap: () {
          Navigator.pop(context);
          onTap?.call();
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: context.screenHeight * 0.015,
            bottom: context.screenHeight * 0.015,
            left: 30,
          ),
          child: Text(
            title.tr(),
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: isSelected ? Colors.black : drawerItemUnselectedColor,
                ),
          ),
        ),
      ),
    );
  }
}
