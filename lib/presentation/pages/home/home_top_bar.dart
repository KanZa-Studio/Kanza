import 'package:flutter/material.dart';
import '../../values/colors.dart';
import '../../../utils/extensions/responsive_helper.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: context.screenHeight * 0.25,
      width: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: context.screenHeight * 0.02),
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.menu, color: Colors.white),
              ),
              SizedBox(height: context.screenHeight * 0.05),
              Text(
                'Hi, Kanan',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
