part of 'category_operations_cubit.dart';

abstract class CategoryOperationsState {
  const CategoryOperationsState();
}

class CategoryOperationsInitial extends CategoryOperationsState {}

class CategoriesChanged extends CategoryOperationsState {}

class CategoryOperationsFailure extends CategoryOperationsState {
  CategoryOperationsFailure(this.message) : assert(message != null);

  final String message;
}
