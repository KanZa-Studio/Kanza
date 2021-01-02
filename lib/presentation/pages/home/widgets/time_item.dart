import 'package:flutter/material.dart';
import '../../../../utils/extensions/theme_extension.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({
    @required this.title,
    @required this.backgroundColor,
    this.selected = false,
    @required this.onClicked,
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
  });

  final String title;
  final Color backgroundColor;
  final bool selected;
  final VoidCallback onClicked;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6.0),
        border: selected
            ? Border.all(
                color: Theme.of(context).selecteTimeItemBorderColor,
                width: 3,
              )
            : null,
      ),
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.overline.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
