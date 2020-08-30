import 'package:flutter/material.dart';

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
      width: 96,
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6.0),
        border: selected ? Border.all() : null,
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
