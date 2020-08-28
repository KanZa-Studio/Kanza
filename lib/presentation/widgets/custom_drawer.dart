import 'package:flutter/material.dart';

import '../../utils/extensions/responsive_helper.dart';
import '../values/colors.dart';
import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/translator.dart';

class CustomDrawer extends StatelessWidget {
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildItem(context, home, true),
                      SizedBox(height: context.screenHeight * 0.03),
                      _buildItem(context, editCategories),
                      SizedBox(height: context.screenHeight * 0.03),
                      _buildItem(context, archives),
                      SizedBox(height: context.screenHeight * 0.03),
                      _buildItem(context, shareApp),
                      Spacer(),
                      _buildItem(context, about),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildItem(
    BuildContext context,
    String title, [
    bool isSelected = false,
  ]) {
    return Text(
      title.tr(),
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: isSelected ? Colors.black : drawerItemUnselectedColor,
          ),
    );
  }
}
