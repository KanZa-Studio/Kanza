import '../services/database_service.dart';

abstract class BaseCategoryRepository {
  Future<List<TodoCategoryEntity>> getAllCategories();

  Future<int> addCategory(TodoCategoryEntity todoCategoryEntity);

  Future<int> deleteCategory(TodoCategoryEntity todoCategoryEntity);

  Future<bool> updateCategory(TodoCategoryEntity todoCategoryEntity);
}
