import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/contractors/base_category_repository.dart';
import '../../data/services/database_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({@required this.categoryRepository})
      : assert(categoryRepository != null),
        super(CategoryState.initial());

  final BaseCategoryRepository categoryRepository;

  final _errorMessageController = StreamController<String>.broadcast();
  Stream<String> get errorMessage => _errorMessageController.stream;

  void fetchAllCategories() => emit(CategoryState.success(
      allCategoriesStream: categoryRepository.getAllCategory()));

  void addNewCategory(TodoCategoryEntity category) {
    try {
      categoryRepository.addCategory(category);
    } on Exception {
      _errorMessageController.add('Element already exists!');
    }
  }

  @override
  Future<void> close() {
    _errorMessageController?.close();
    return super.close();
  }
}
