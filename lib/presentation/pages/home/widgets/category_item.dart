import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../data/services/database_service.dart';
import '../../../dialogs/category_dialog.dart';
import '../../../../utils/extensions/color_extension.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({this.todoCategory});

  final TodoCategoryEntity todoCategory;

  @override
  Widget build(BuildContext context) {
    final isAddButton = todoCategory.name == null;

    return isAddButton
        ? Container(
            width: 65,
            margin: const EdgeInsets.only(left: 16, right: 4),
            child: Material(
              borderRadius: BorderRadius.circular(6.0),
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  showDialog(context: context, child: CategoryDialog());
                },
                borderRadius: BorderRadius.circular(6.0),
                child: Center(
                  child: Text(
                    'Add',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          )
        : Container(
            width: 96,
            height: 53,
            margin: EdgeInsets.only(left: 4, right: 4),
            decoration: BoxDecoration(
              color: isAddButton
                  ? Theme.of(context).primaryColor
                  : todoCategory.color.toColor(),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Center(
              child: Text(
                todoCategory.name,
                style: Theme.of(context).textTheme.caption,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
          );
  }
}
