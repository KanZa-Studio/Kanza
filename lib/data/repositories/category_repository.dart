import 'package:kanza/data/services/database_service.dart';

import '../contractors/base_category_repository.dart';
import '../services/database_service.dart';

class CategoryRepository implements BaseCategoryRepository {
  CategoryRepository(this.kanzaDb) : assert(kanzaDb != null);

  final KanzaDatabase kanzaDb;

  @override
  Future<List<TodoCategoryEntity>> getAllCategories() =>
      kanzaDb.todoCategoryDao.getAllCategories();

  @override
  Future<int> addCategory(TodoCategoryEntity todoCategoryEntity) =>
      kanzaDb.todoCategoryDao.insertTodoCategory(todoCategoryEntity);

  @override
  Future<int> deleteCategory(TodoCategoryEntity todoCategoryEntity) =>
      kanzaDb.todoCategoryDao.deleteTodoCategory(todoCategoryEntity);

  @override
  Future<bool> updateCategory(TodoCategoryEntity todoCategoryEntity) =>
      kanzaDb.todoCategoryDao.updateTodoCategory(todoCategoryEntity);
}
