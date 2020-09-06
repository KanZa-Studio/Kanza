import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './dismissible.dart';
import '../../../../data/services/database_service.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/extensions/color_extension.dart';
import '../../../../utils/extensions/theme_extension.dart';
import '../../../values/colors.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({this.task});

  final Task task;

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool showTimeColor = true;

  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      onResize: () {
        print('onResize');
      },
      key: ValueKey(widget.task.id),
      movementDuration: Duration(seconds: 1),
      dragStartBehavior: DragStartBehavior.start,
      onDismissed: (direction) {
        print('test');
      },
      confirmDismiss: (direction) async {
        print('working');
        return false;
      },
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: LightThemeColor.archiveBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
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
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12.0),
        ),
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
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 76,
        child: Row(
          children: [
            Visibility(
              visible: showTimeColor,
              child: Container(
                height: 76,
                width: 10,
                decoration: BoxDecoration(
                  color: widget.task.timeColor.toColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Visibility(
              visible: showTimeColor,
              child: const SizedBox(width: 6),
            ),
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
                          widget.task.title,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                decoration: widget.task.completed
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: Theme.of(context).drawerItemTextColor,
                              ),
                        ),
                        Text(
                          widget.task.details,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.normal,
                                decoration: widget.task.completed
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
                        color: widget.task.completed
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      child: widget.task.completed
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
