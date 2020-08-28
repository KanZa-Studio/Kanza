part of 'category_operations_cubit.dart';

abstract class CategoryOperationsState extends Equatable {
  const CategoryOperationsState();

  @override
  List<Object> get props => [];
}

class CategoryOperationsInitial extends CategoryOperationsState {}

class CategoriesChanged extends CategoryOperationsState {}

class CategoryOperationsFailure extends CategoryOperationsState {
  CategoryOperationsFailure(this.message) : assert(message != null);

  final String message;

  @override
  List<Object> get props => [message];
}
