part of 'category_cubit.dart';

enum CategoryStatus { initial, failure, success }

class CategoryState extends Equatable {
  const CategoryState._({
    this.categoryStatus = CategoryStatus.initial,
    this.categories,
    this.errorMessage,
  });

  const CategoryState.initial() : this._();

  const CategoryState.success({List<TodoCategoryEntity> categories})
      : this._(categoryStatus: CategoryStatus.success, categories: categories);

  const CategoryState.failure(String errorMessage)
      : this._(
            categoryStatus: CategoryStatus.failure, errorMessage: errorMessage);

  final CategoryStatus categoryStatus;
  final List<TodoCategoryEntity> categories;
  final String errorMessage;

  @override
  List<Object> get props => [categoryStatus, categories];
}
