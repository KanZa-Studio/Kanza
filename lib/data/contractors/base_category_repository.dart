import '../services/database_service.dart';

abstract class BaseCategoryRepository {
  Stream<List<TodoCategoryEntity>> getAllCategory();

  Future<int> addCategory(TodoCategoryEntity todoCategoryEntity);

  Future<int> deleteCategory(TodoCategoryEntity todoCategoryEntity);

  Future<bool> updateCategory(TodoCategoryEntity todoCategoryEntity);
}
