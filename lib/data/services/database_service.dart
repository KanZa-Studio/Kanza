import 'package:moor_flutter/moor_flutter.dart';

part 'database_service.g.dart';

@UseMoor(
  tables: [Todo, TodoCategory],
  daos: [TodoDao, TodoCategoryDao],
)
class KanzaDatabase extends _$KanzaDatabase {
  KanzaDatabase._internal()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.kanza', logStatements: true));

  static final KanzaDatabase _instance = KanzaDatabase._internal();

  factory KanzaDatabase() => _instance;

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Todo])
class TodoDao extends DatabaseAccessor<KanzaDatabase> with _$TodoDaoMixin {
  TodoDao(this.db) : super(db);

  final KanzaDatabase db;

  Stream<List<TodoData>> watchAllTodo() {
    return (select(todo)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ]))
        .watch();
  }

  Stream<List<TodoData>> watchAllCompletedTodo() {
    return (select(todo)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ])
          ..where((t) => t.completed.equals(true)))
        .watch();
  }

  Future<int> insertTodo(Insertable<TodoData> todoData) =>
      into(todo).insert(todoData);

  Future<bool> updateTodo(Insertable<TodoData> todoData) =>
      update(todo).replace(todoData);

  Future<int> deleteTodo(Insertable<TodoData> todoData) =>
      delete(todo).delete(todoData);
}

@UseDao(tables: [TodoCategory])
class TodoCategoryDao extends DatabaseAccessor<KanzaDatabase>
    with _$TodoCategoryDaoMixin {
  TodoCategoryDao(this.db) : super(db);

  final KanzaDatabase db;

  Stream<List<TodoCategoryData>> watchAllCategories() {
    return (select(todoCategory)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ]))
        .watch();
  }

  Future<int> insertTodoCategory(Insertable<TodoCategoryData> category) =>
      into(todoCategory).insert(category);

  Future<bool> updateTodo(Insertable<TodoCategoryData> category) =>
      update(todoCategory).replace(category);

  Future<int> deleteTodo(Insertable<TodoCategoryData> todoData) =>
      delete(todoCategory).delete(todoData);
}

class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 40)();

  TextColumn get details => text().nullable().withLength(min: 1, max: 100)();

  DateTimeColumn get dueDate => dateTime().nullable()();

  BoolColumn get completed => boolean().withDefault(Constant(false))();

  DateTimeColumn get createdAt => dateTime()();
}

class TodoCategory extends Table {
  TextColumn get title => text().withLength(min: 1, max: 20)();

  TextColumn get color => text().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {title};
}
