import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/services/database_service.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/extensions/color_extension.dart';
import '../../../values/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      movementDuration: Duration(seconds: 1),
      key: ValueKey(task.id),
      confirmDismiss: (direction) async => false,
      background: Container(
        color: LightThemeColor.archiveBackgroundColor,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SvgPicture.asset(
                Assets.icons.archive,
                width: 17,
                height: 17,
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                Assets.icons.bin,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 76,
        child: Row(
          children: [
            Container(
              height: 76,
              width: 10,
              decoration: BoxDecoration(
                color: task.timeColor.toColor(),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          task.title,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                decoration: task.completed
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: task.completed
                                    ? LightThemeColor.todoItemSubtitleColor
                                    : Colors.black,
                              ),
                        ),
                        Text(
                          task.details,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.normal,
                                color: LightThemeColor.todoItemSubtitleColor,
                                decoration: task.completed
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                        ),
                      ],
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: task.completed
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      child: task.completed
                          ? Center(
                              child: SvgPicture.asset(Assets.icons.approve),
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
