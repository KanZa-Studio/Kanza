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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.menu, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                Text(
                  'kanza.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'HELLO, KANAN',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
