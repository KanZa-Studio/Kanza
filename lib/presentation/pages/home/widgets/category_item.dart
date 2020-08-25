import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    this.title,
    this.color,
    this.isAddButton = false,
  });

  final String title;
  final Color color;
  final bool isAddButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isAddButton ? 55 : 96,
      height: 53,
      margin: EdgeInsets.only(left: isAddButton ? 16 : 4, right: 4),
      decoration: BoxDecoration(
        color: isAddButton ? Theme.of(context).primaryColor : color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          isAddButton ? 'Add' : title,
          style: Theme.of(context).textTheme.caption.copyWith(
                color: isAddButton ? Colors.white : Colors.black,
              ),
          overflow: TextOverflow.clip,
          maxLines: 1,
        ),
      ),
    );
  }
}
