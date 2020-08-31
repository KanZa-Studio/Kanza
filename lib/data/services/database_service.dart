import 'package:moor_flutter/moor_flutter.dart';

part 'database_service.g.dart';

@UseMoor(
  tables: [TaskEntity],
  daos: [TodoDao],
)
class KanzaDatabase extends _$KanzaDatabase {
  KanzaDatabase._internal()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.kanza', logStatements: true));

  static final KanzaDatabase _instance = KanzaDatabase._internal();

  factory KanzaDatabase() => _instance;

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration =>
  //     MigrationStrategy(beforeOpen: (details) async {
  //       _instance.customStatement('PRAGMA foreign_keys = ON');
  //     });
}

@UseDao(tables: [TaskEntity])
class TodoDao extends DatabaseAccessor<KanzaDatabase> with _$TodoDaoMixin {
  TodoDao(this.db) : super(db);

  final KanzaDatabase db;

  Stream<List<Task>> getAllTodo() => select(taskEntity).watch();

  Future<int> insertTodo(Insertable<Task> todoData) =>
      into(taskEntity).insert(todoData);

  Future<bool> updateTodo(Insertable<Task> todoData) =>
      update(taskEntity).replace(todoData);

  Future<int> deleteTodo(Insertable<Task> todoData) =>
      delete(taskEntity).delete(todoData);
}

// @UseDao(tables: [TodoCategory])
// class TodoCategoryDao extends DatabaseAccessor<KanzaDatabase>
//     with _$TodoCategoryDaoMixin {
//   TodoCategoryDao(this.db) : super(db);

//   final KanzaDatabase db;

//   Future<List<TodoCategoryEntity>> getAllCategories() {
//     return (select(todoCategory)
//           ..orderBy([
//             (t) =>
//                 OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
//           ]))
//         .get();
//   }

//   Future<int> insertTodoCategory(Insertable<TodoCategoryEntity> category) =>
//       into(todoCategory).insert(category);

//   Future<bool> updateTodoCategory(Insertable<TodoCategoryEntity> category) =>
//       update(todoCategory).replace(category);

//   Future<int> deleteTodoCategory(Insertable<TodoCategoryEntity> todoData) =>
//       delete(todoCategory).delete(todoData);
// }

// /// used for [foreign keys] and [joins]
// class TodoWithCategory {
//   TodoWithCategory({
//     @required this.todoData,
//     @required this.todoCategoryData,
//   });

//   final TodoEntitiy todoData;
//   final TodoCategoryEntity todoCategoryData;
// }

@DataClassName('Task')
class TaskEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 40)();

  TextColumn get details => text().nullable().withLength(min: 1, max: 100)();

  DateTimeColumn get dueDate => dateTime().nullable()();

  BoolColumn get completed => boolean().withDefault(Constant(false))();

  BoolColumn get archived => boolean().withDefault(Constant(false))();

  TextColumn get timeColor => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  // TextColumn get categoryName => text()
  //     .nullable()
  //     .customConstraint('NULL REFERENCES todoCategory(title)')();
}

// @DataClassName('TodoCategoryEntity')
// class TodoCategory extends Table {
//   TextColumn get name => text().withLength(min: 1, max: 20)();

//   TextColumn get color => text().nullable()();

//   DateTimeColumn get createdAt => dateTime().nullable()();

//   @override
//   Set<Column> get primaryKey => {name};
// }
