part of 'category_cubit.dart';

enum CategoryStatus {
  initial,
  progress,
  failure,
  success,
}

class CategoryState extends Equatable {
  const CategoryState._([
    this.categoryStatus = CategoryStatus.initial,
    this.allCategoriesStream,
  ]);

  const CategoryState.initial() : this._();

  const CategoryState.success(
      {Stream<List<TodoCategoryEntity>> allCategoriesStream})
      : this._(CategoryStatus.success, allCategoriesStream);

  final CategoryStatus categoryStatus;
  final Stream<List<TodoCategoryEntity>> allCategoriesStream;

  @override
  List<Object> get props => [categoryStatus, allCategoriesStream];
}
