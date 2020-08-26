import 'package:flutter/material.dart';

import './add_todo_bottom_sheet.dart';
import '../../../values/colors.dart';

class CustomFabButton extends StatefulWidget {
  @override
  _CustomFabButtonState createState() => _CustomFabButtonState();
}

class _CustomFabButtonState extends State<CustomFabButton>
    with TickerProviderStateMixin {
  bool _showFabButton = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final bottomSheetController = Scaffold.of(context).showBottomSheet(
          (context) => AddTodoBottomSheet(),
          backgroundColor: Colors.transparent,
        );

        setState(() {
          _showFabButton = false;
        });

        bottomSheetController.closed.then((value) {
          setState(() {
            _showFabButton = true;
          });
        });
      },
      child: Visibility(
        visible: _showFabButton,
        child: Container(
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
        ),
      ),
    );
  }
}
