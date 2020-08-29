import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './category_item.dart';
import '../../../../blocs/category_cubit/category_cubit.dart';
import '../../../../data/services/database_service.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listenWhen: (_, curr) => curr.categoryStatus == CategoryStatus.failure,
      listener: (context, state) {
        print('working');
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                children: [
                  Text(state.errorMessage),
                ],
              ),
            ),
          );
      },
      builder: (context, state) {
        final categories = [TodoCategoryEntity(name: null)];

        if (state.categoryStatus == CategoryStatus.success) {
          categories.addAll(state.categories);
        }

        /// renders only add button if state is [failure] or [initial]
        /// if the state if [success] it will load [categories]
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) =>
              CategoryItem(todoCategory: categories[i]),
          itemCount: categories.length,
        );
      },
    );
  }
}
