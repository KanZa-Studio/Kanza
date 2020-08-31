import 'package:flutter/material.dart';

import '../../../values/colors.dart';

class AddTodoBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: LightThemeColor.todoItemBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(44),
          topRight: Radius.circular(44),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 18,
            offset: const Offset(0.0, -4.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
              width: 25,
              height: 3,
              color: LightThemeColor.bottomSheetHandlerColor),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
