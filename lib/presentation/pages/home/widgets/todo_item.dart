import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/assets.dart';
import '../../../values/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    this.title,
    this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(title),
      background: Row(
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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        height: 76,
        child: Row(
          children: [
            Container(
              height: 76,
              width: 10,
              decoration: BoxDecoration(
                color: category2,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
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
                          'Lorem Ipsum',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem Ipsum',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.normal,
                                color: todoItemSubtitleColor,
                              ),
                        ),
                      ],
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                        shape: BoxShape.circle,
                      ),
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
