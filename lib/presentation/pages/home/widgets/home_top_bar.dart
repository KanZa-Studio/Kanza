import 'package:flutter/material.dart';

import '../../../values/colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  const SizedBox(width: 11),
                  Text(
                    'kanza.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'HELLO, ZAHİR',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
