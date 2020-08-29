import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/translator.dart';
import '../../utils/extensions/responsive_helper.dart';
import '../values/colors.dart';
import '../../blocs/category_operations_cubit/category_operations_cubit.dart';
import '../../blocs/category_cubit/category_cubit.dart';

class CategoryDialog extends StatefulWidget {
  @override
  _CategoryDialogState createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  int selectedIndex = 0;
  Color selectedColor = category1;
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return BlocConsumer<CategoryOperationsCubit, CategoryOperationsState>(
      listenWhen: (prev, curr) =>
          curr is CategoryOperationsFailure || curr is CategoriesChanged,
      listener: (context, state) {
        if (state is CategoriesChanged) {
          context.bloc<CategoryCubit>().fetchAllCategories();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  color.tr(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: screenHeight * 0.0406),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _colorItem(0, category1, screenWidth),
                    _colorItem(1, category2, screenWidth),
                    _colorItem(2, category3, screenWidth),
                    _colorItem(3, category4, screenWidth),
                    _colorItem(4, category5, screenWidth),
                  ],
                ),
                SizedBox(height: screenHeight * 0.0186),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _colorItem(5, category6, screenWidth),
                    _colorItem(6, category7, screenWidth),
                    _colorItem(7, category8, screenWidth),
                    _colorItem(8, category9, screenWidth),
                    _colorItem(9, category10, screenWidth),
                  ],
                ),
                SizedBox(height: screenHeight * 0.0603),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 120,
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: title.tr(),
                        hintStyle:
                            Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: textFieldHintColor,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: underlinedBorderColor,
                            width: 1.5,
                          ),
                        ),
                        errorText: state is CategoryOperationsFailure
                            ? state.message
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.0566),
                Center(
                  child: Material(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(23),
                    child: InkWell(
                      onTap: () =>
                          context.bloc<CategoryOperationsCubit>().addCategory(
                                name: titleController.text.trim(),
                                color: selectedColor,
                              ),
                      borderRadius: BorderRadius.circular(23),
                      child: SizedBox(
                        width: 93,
                        height: 42,
                        child: Center(
                          child: Text(
                            add,
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                          ).tr(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _colorItem(int index, Color color, double screenWidth) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
            selectedColor = color;
          });
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: screenWidth * 0.10,
          width: screenWidth * 0.10,
          decoration: BoxDecoration(
            border: index == selectedIndex
                ? Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )
                : null,
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      );
}