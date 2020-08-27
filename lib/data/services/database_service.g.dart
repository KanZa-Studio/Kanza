// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TodoEntitiy extends DataClass implements Insertable<TodoEntitiy> {
  final int id;
  final String title;
  final String details;
  final DateTime dueDate;
  final bool completed;
  final DateTime createdAt;
  final String categoryName;
  TodoEntitiy(
      {@required this.id,
      @required this.title,
      this.details,
      this.dueDate,
      @required this.completed,
      @required this.createdAt,
      this.categoryName});
  factory TodoEntitiy.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return TodoEntitiy(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      details:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}details']),
      dueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      categoryName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    return map;
  }

  TodoCompanion toCompanion(bool nullToAbsent) {
    return TodoCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
    );
  }

  factory TodoEntitiy.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TodoEntitiy(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      details: serializer.fromJson<String>(json['details']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      completed: serializer.fromJson<bool>(json['completed']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'details': serializer.toJson<String>(details),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'completed': serializer.toJson<bool>(completed),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  TodoEntitiy copyWith(
          {int id,
          String title,
          String details,
          DateTime dueDate,
          bool completed,
          DateTime createdAt,
          String categoryName}) =>
      TodoEntitiy(
        id: id ?? this.id,
        title: title ?? this.title,
        details: details ?? this.details,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
        createdAt: createdAt ?? this.createdAt,
        categoryName: categoryName ?? this.categoryName,
      );
  @override
  String toString() {
    return (StringBuffer('TodoEntitiy(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              details.hashCode,
              $mrjc(
                  dueDate.hashCode,
                  $mrjc(completed.hashCode,
                      $mrjc(createdAt.hashCode, categoryName.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TodoEntitiy &&
          other.id == this.id &&
          other.title == this.title &&
          other.details == this.details &&
          other.dueDate == this.dueDate &&
          other.completed == this.completed &&
          other.createdAt == this.createdAt &&
          other.categoryName == this.categoryName);
}

class TodoCompanion extends UpdateCompanion<TodoEntitiy> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> details;
  final Value<DateTime> dueDate;
  final Value<bool> completed;
  final Value<DateTime> createdAt;
  final Value<String> categoryName;
  const TodoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.details = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  TodoCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.details = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
    @required DateTime createdAt,
    this.categoryName = const Value.absent(),
  })  : title = Value(title),
        createdAt = Value(createdAt);
  static Insertable<TodoEntitiy> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> details,
    Expression<DateTime> dueDate,
    Expression<bool> completed,
    Expression<DateTime> createdAt,
    Expression<String> categoryName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (details != null) 'details': details,
      if (dueDate != null) 'due_date': dueDate,
      if (completed != null) 'completed': completed,
      if (createdAt != null) 'created_at': createdAt,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  TodoCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> details,
      Value<DateTime> dueDate,
      Value<bool> completed,
      Value<DateTime> createdAt,
      Value<String> categoryName}) {
    return TodoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $TodoTable extends Todo with TableInfo<$TodoTable, TodoEntitiy> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 40);
  }

  final VerificationMeta _detailsMeta = const VerificationMeta('details');
  GeneratedTextColumn _details;
  @override
  GeneratedTextColumn get details => _details ??= _constructDetails();
  GeneratedTextColumn _constructDetails() {
    return GeneratedTextColumn('details', $tableName, true,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  GeneratedDateTimeColumn _dueDate;
  @override
  GeneratedDateTimeColumn get dueDate => _dueDate ??= _constructDueDate();
  GeneratedDateTimeColumn _constructDueDate() {
    return GeneratedDateTimeColumn(
      'due_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  GeneratedTextColumn _categoryName;
  @override
  GeneratedTextColumn get categoryName =>
      _categoryName ??= _constructCategoryName();
  GeneratedTextColumn _constructCategoryName() {
    return GeneratedTextColumn('category_name', $tableName, true,
        $customConstraints: 'NULL REFERENCES todoCategory(title)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, details, dueDate, completed, createdAt, categoryName];
  @override
  $TodoTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todo';
  @override
  final String actualTableName = 'todo';
  @override
  VerificationContext validateIntegrity(Insertable<TodoEntitiy> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details'], _detailsMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date'], _dueDateMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed'], _completedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name'], _categoryNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoEntitiy map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TodoEntitiy.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TodoTable createAlias(String alias) {
    return $TodoTable(_db, alias);
  }
}

class TodoCategoryEntity extends DataClass
    implements Insertable<TodoCategoryEntity> {
  final String name;
  final String color;
  final DateTime createdAt;
  TodoCategoryEntity({@required this.name, this.color, this.createdAt});
  factory TodoCategoryEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return TodoCategoryEntity(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      color:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TodoCategoryCompanion toCompanion(bool nullToAbsent) {
    return TodoCategoryCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TodoCategoryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TodoCategoryEntity(
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TodoCategoryEntity copyWith(
          {String name, String color, DateTime createdAt}) =>
      TodoCategoryEntity(
        name: name ?? this.name,
        color: color ?? this.color,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('TodoCategoryEntity(')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(name.hashCode, $mrjc(color.hashCode, createdAt.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TodoCategoryEntity &&
          other.name == this.name &&
          other.color == this.color &&
          other.createdAt == this.createdAt);
}

class TodoCategoryCompanion extends UpdateCompanion<TodoCategoryEntity> {
  final Value<String> name;
  final Value<String> color;
  final Value<DateTime> createdAt;
  const TodoCategoryCompanion({
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoCategoryCompanion.insert({
    @required String name,
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TodoCategoryEntity> custom({
    Expression<String> name,
    Expression<String> color,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoCategoryCompanion copyWith(
      {Value<String> name, Value<String> color, Value<DateTime> createdAt}) {
    return TodoCategoryCompanion(
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCategoryCompanion(')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TodoCategoryTable extends TodoCategory
    with TableInfo<$TodoCategoryTable, TodoCategoryEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodoCategoryTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedTextColumn _color;
  @override
  GeneratedTextColumn get color => _color ??= _constructColor();
  GeneratedTextColumn _constructColor() {
    return GeneratedTextColumn(
      'color',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, color, createdAt];
  @override
  $TodoCategoryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todo_category';
  @override
  final String actualTableName = 'todo_category';
  @override
  VerificationContext validateIntegrity(Insertable<TodoCategoryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  TodoCategoryEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TodoCategoryEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TodoCategoryTable createAlias(String alias) {
    return $TodoCategoryTable(_db, alias);
  }
}

abstract class _$KanzaDatabase extends GeneratedDatabase {
  _$KanzaDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TodoTable _todo;
  $TodoTable get todo => _todo ??= $TodoTable(this);
  $TodoCategoryTable _todoCategory;
  $TodoCategoryTable get todoCategory =>
      _todoCategory ??= $TodoCategoryTable(this);
  TodoDao _todoDao;
  TodoDao get todoDao => _todoDao ??= TodoDao(this as KanzaDatabase);
  TodoCategoryDao _todoCategoryDao;
  TodoCategoryDao get todoCategoryDao =>
      _todoCategoryDao ??= TodoCategoryDao(this as KanzaDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todo, todoCategory];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TodoDaoMixin on DatabaseAccessor<KanzaDatabase> {
  $TodoTable get todo => attachedDatabase.todo;
  $TodoCategoryTable get todoCategory => attachedDatabase.todoCategory;
}
mixin _$TodoCategoryDaoMixin on DatabaseAccessor<KanzaDatabase> {
  $TodoCategoryTable get todoCategory => attachedDatabase.todoCategory;
}
