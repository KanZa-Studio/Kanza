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

  void fetchAllCategories() async {
    try {
      final categories = await categoryRepository.getAllCategories();
      emit(CategoryState.success(categories: categories));
    } on Exception {
      emit(CategoryState.failure('failed to load categories!'));
    }
  }
}
