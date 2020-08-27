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

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(beforeOpen: (details) async {
        _instance.customStatement('PRAGMA foreign_keys = ON');
      });
}

@UseDao(tables: [Todo, TodoCategory])
class TodoDao extends DatabaseAccessor<KanzaDatabase> with _$TodoDaoMixin {
  TodoDao(this.db) : super(db);

  final KanzaDatabase db;

  Stream<List<TodoWithCategory>> watchAllTodo() {
    return (select(todo)
          ..orderBy(
            [
              (t) =>
                  OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
            ],
          ))
        .join(
          [
            leftOuterJoin(
                todoCategory, todoCategory.name.equalsExp(todo.categoryName)),
          ],
        )
        .watch()
        .map((todoRows) => todoRows.map(
              (row) {
                return TodoWithCategory(
                  todoData: row.readTable(todo),
                  todoCategoryData: row.readTable(todoCategory),
                );
              },
            ).toList());
  }

  Stream<List<TodoEntitiy>> watchAllCompletedTodo() {
    return (select(todo)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ])
          ..where((t) => t.completed.equals(true)))
        .watch();
  }

  Future<int> insertTodo(Insertable<TodoEntitiy> todoData) =>
      into(todo).insert(todoData);

  Future<bool> updateTodo(Insertable<TodoEntitiy> todoData) =>
      update(todo).replace(todoData);

  Future<int> deleteTodo(Insertable<TodoEntitiy> todoData) =>
      delete(todo).delete(todoData);
}

@UseDao(tables: [TodoCategory])
class TodoCategoryDao extends DatabaseAccessor<KanzaDatabase>
    with _$TodoCategoryDaoMixin {
  TodoCategoryDao(this.db) : super(db);

  final KanzaDatabase db;

  Stream<List<TodoCategoryEntity>> watchAllCategories() {
    return (select(todoCategory)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ]))
        .watch();
  }

  Future<int> insertTodoCategory(Insertable<TodoCategoryEntity> category) =>
      into(todoCategory).insert(category);

  Future<bool> updateTodo(Insertable<TodoCategoryEntity> category) =>
      update(todoCategory).replace(category);

  Future<int> deleteTodo(Insertable<TodoCategoryEntity> todoData) =>
      delete(todoCategory).delete(todoData);
}

/// used for [foreign keys] and [joins]
class TodoWithCategory {
  TodoWithCategory({
    @required this.todoData,
    @required this.todoCategoryData,
  });

  final TodoEntitiy todoData;
  final TodoCategoryEntity todoCategoryData;
}

@DataClassName('TodoEntitiy')
class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 40)();

  TextColumn get details => text().nullable().withLength(min: 1, max: 100)();

  DateTimeColumn get dueDate => dateTime().nullable()();

  BoolColumn get completed => boolean().withDefault(Constant(false))();

  DateTimeColumn get createdAt => dateTime()();

  TextColumn get categoryName => text()
      .nullable()
      .customConstraint('NULL REFERENCES todoCategory(title)')();
}

@DataClassName('TodoCategoryEntity')
class TodoCategory extends Table {
  TextColumn get name => text().withLength(min: 1, max: 20)();

  TextColumn get color => text().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {name};
}
