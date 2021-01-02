import 'package:flutter/material.dart';

import '../../../../utils/extensions/responsive_helper.dart';
import '../../../../utils/extensions/theme_extension.dart';
import '../../../values/colors.dart';

class AddTodoBottomSheet extends StatefulWidget {
  @override
  _AddTodoBottomSheetState createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final _calendarButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final hintStyle = Theme.of(context).textTheme.caption.copyWith(
          fontWeight: FontWeight.w400,
        );

    final popupItemStyle = Theme.of(context).textTheme.overline.copyWith(
          fontWeight: FontWeight.w400,
        );

    final underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: LightThemeColor.kTextFieldUnderlineColor,
      ),
    );

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 18,
              offset: const Offset(0.0, -2.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: context.screenWidth * 0.09,
              height: context.screenHeight * 0.008,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFDBDBDB),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.4,
                    child: TextField(
                      style: hintStyle,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: hintStyle,
                        enabledBorder: underlineInputBorder,
                        focusedBorder: underlineInputBorder,
                        border: underlineInputBorder,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Material(
                    color: Theme.of(context).cardColor,
                    child: InkWell(
                      onTap: () async {
                        RenderBox calendarBox = _calendarButtonKey
                            .currentContext
                            .findRenderObject();

                        final offset = calendarBox.localToGlobal(Offset.zero);

                        showMenu(
                          context: context,
                          position:
                              RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
                          items: [
                            PopupMenuItem<String>(
                              child: const Text('Today'),
                              value: 'Today',
                              textStyle: popupItemStyle,
                            ),
                            PopupMenuItem<String>(
                              child: const Text('Tomorrow'),
                              value: 'Tomorrow',
                              textStyle: popupItemStyle,
                            ),
                            PopupMenuItem<String>(
                              child: const Text('Pick a date'),
                              value: 'Pick a date',
                              textStyle: popupItemStyle,
                            ),
                          ],
                        );
                        // final pickedDate = await showDatePicker(
                        //   context: context,
                        //   initialDate: DateTime.now(),
                        //   firstDate: DateTime(1999),
                        //   lastDate: DateTime.now(),
                        // );
                      },
                      child: Image(
                        key: _calendarButtonKey,
                        image: AssetImage('assets/images/calendar.png'),
                        fit: BoxFit.contain,
                        width: context.screenWidth * 0.07,
                        height: context.screenHeight * 0.07,
                        color: Theme.of(context).isDark ? Colors.white : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.4,
                    child: TextField(
                      style: hintStyle,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: hintStyle,
                        enabledBorder: underlineInputBorder,
                        focusedBorder: underlineInputBorder,
                        border: underlineInputBorder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: Material(
                color: Theme.of(context).cardColor,
                child: InkWell(
                  onTap: () {
                    print('tapped');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 15),
                    child: Image(
                      image: AssetImage('assets/images/send.png'),
                      fit: BoxFit.contain,
                      color: Theme.of(context).isDark ? Colors.white : null,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
