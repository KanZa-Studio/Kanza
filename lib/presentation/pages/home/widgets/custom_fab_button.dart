import 'package:flutter/material.dart';

import '../../../values/colors.dart';

class CustomFabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53,
      height: 53,
      margin: const EdgeInsets.only(bottom: 49, right: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
        boxShadow: [
          const BoxShadow(
            blurRadius: 30,
            offset: const Offset(0.0, 4.0),
            color: fabShadowColor,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
