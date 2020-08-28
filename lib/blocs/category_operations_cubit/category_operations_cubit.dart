import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../data/contractors/base_category_repository.dart';
import '../../data/services/database_service.dart';
import '../../utils/extensions/color_extension.dart';
import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/translator.dart';

part 'category_operations_state.dart';

class CategoryOperationsCubit extends Cubit<CategoryOperationsState> {
  CategoryOperationsCubit(this.categoryRepository)
      : assert(categoryRepository != null),
        super(CategoryOperationsInitial());

  final BaseCategoryRepository categoryRepository;

  void addCategory(
      {@required final String name, @required final Color color}) async {
    final category = TodoCategoryEntity(
      name: name,
      color: color.toStringColor(),
      createdAt: DateTime.now(),
    );

    try {
      await categoryRepository.addCategory(category);
      emit(CategoriesChanged());
    } on Exception {
      emit(CategoryOperationsFailure(categoryAddFail.tr()));
    }
  }

  void deleteCategory(TodoCategoryEntity todoCategoryEntity) async {
    try {
      await categoryRepository.deleteCategory(todoCategoryEntity);
      emit(CategoriesChanged());
    } on Exception {
      debugPrint('Delete Category: Error occured!');
    }
  }

  void updateCategory(TodoCategoryEntity todoCategoryEntity) async {
    try {
      await categoryRepository.updateCategory(todoCategoryEntity);
      emit(CategoriesChanged());
    } on Exception {
      debugPrint('Update Category: Error occured!');
    }
  }
}
