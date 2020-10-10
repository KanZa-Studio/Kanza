import 'package:flutter/material.dart';
import 'package:kanza/presentation/values/colors.dart';
import '../../../../utils/extensions/theme_extension.dart';
import './add_todo_bottom_sheet.dart';

class CustomFab extends StatefulWidget {
  const CustomFab({Key key}) : super(key: key);

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _showFab,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 0.0),
            color: Theme.of(context).fabButtonShadowColor,
            blurRadius: 12.0,
          ),
        ]),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).fabButtonColor,
          child: InkWell(
            splashColor: Colors.grey,
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              final controller = Scaffold.of(context).showBottomSheet(
                (context) => AddTodoBottomSheet(),
                backgroundColor: Colors.transparent,
              );

              setState(() {
                _showFab = false;
              });

              controller.closed.then((value) {
                setState(() {
                  _showFab = true;
                });
              });
            },
            child: Center(
              child: Icon(
                Icons.add,
                size: 35,
                color: Theme.of(context).isDark
                    ? DarkThemeColor.kKanzaTitleTextColor
                    : Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
