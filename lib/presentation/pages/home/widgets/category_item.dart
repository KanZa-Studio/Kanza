import 'package:flutter/material.dart';

import '../../../../data/models/todo_category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    this.todoCategory,
    this.isAddButton = false,
  });

  final TodoCategory todoCategory;
  final bool isAddButton;

  @override
  Widget build(BuildContext context) {
    return todoCategory == null
        ? SizedBox(width: 4)
        : Container(
            width: isAddButton ? 55 : 96,
            height: 53,
            margin: EdgeInsets.only(left: isAddButton ? 16 : 4, right: 4),
            decoration: BoxDecoration(
              color: isAddButton
                  ? Theme.of(context).primaryColor
                  : todoCategory.color,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Center(
              child: Text(
                isAddButton ? 'Add' : todoCategory.title,
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
