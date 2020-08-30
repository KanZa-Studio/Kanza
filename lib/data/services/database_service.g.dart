// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final String details;
  final DateTime dueDate;
  final bool completed;
  final bool archived;
  final DateTime createdAt;
  Task(
      {@required this.id,
      @required this.title,
      this.details,
      this.dueDate,
      @required this.completed,
      @required this.archived,
      @required this.createdAt});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      details:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}details']),
      dueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
      archived:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}archived']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
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
    if (!nullToAbsent || archived != null) {
      map['archived'] = Variable<bool>(archived);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TaskEntityCompanion toCompanion(bool nullToAbsent) {
    return TaskEntityCompanion(
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
      archived: archived == null && nullToAbsent
          ? const Value.absent()
          : Value(archived),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      details: serializer.fromJson<String>(json['details']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      completed: serializer.fromJson<bool>(json['completed']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
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
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Task copyWith(
          {int id,
          String title,
          String details,
          DateTime dueDate,
          bool completed,
          bool archived,
          DateTime createdAt}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        details: details ?? this.details,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
        archived: archived ?? this.archived,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt')
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
                      $mrjc(archived.hashCode, createdAt.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.details == this.details &&
          other.dueDate == this.dueDate &&
          other.completed == this.completed &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt);
}

class TaskEntityCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> details;
  final Value<DateTime> dueDate;
  final Value<bool> completed;
  final Value<bool> archived;
  final Value<DateTime> createdAt;
  const TaskEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.details = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TaskEntityCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.details = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
    this.archived = const Value.absent(),
    @required DateTime createdAt,
  })  : title = Value(title),
        createdAt = Value(createdAt);
  static Insertable<Task> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> details,
    Expression<DateTime> dueDate,
    Expression<bool> completed,
    Expression<bool> archived,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (details != null) 'details': details,
      if (dueDate != null) 'due_date': dueDate,
      if (completed != null) 'completed': completed,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TaskEntityCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> details,
      Value<DateTime> dueDate,
      Value<bool> completed,
      Value<bool> archived,
      Value<DateTime> createdAt}) {
    return TaskEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
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
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TaskEntityTable extends TaskEntity
    with TableInfo<$TaskEntityTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TaskEntityTable(this._db, [this._alias]);
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

  final VerificationMeta _archivedMeta = const VerificationMeta('archived');
  GeneratedBoolColumn _archived;
  @override
  GeneratedBoolColumn get archived => _archived ??= _constructArchived();
  GeneratedBoolColumn _constructArchived() {
    return GeneratedBoolColumn('archived', $tableName, false,
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

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, details, dueDate, completed, archived, createdAt];
  @override
  $TaskEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'task_entity';
  @override
  final String actualTableName = 'task_entity';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
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
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived'], _archivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TaskEntityTable createAlias(String alias) {
    return $TaskEntityTable(_db, alias);
  }
}

abstract class _$KanzaDatabase extends GeneratedDatabase {
  _$KanzaDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TaskEntityTable _taskEntity;
  $TaskEntityTable get taskEntity => _taskEntity ??= $TaskEntityTable(this);
  TodoDao _todoDao;
  TodoDao get todoDao => _todoDao ??= TodoDao(this as KanzaDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskEntity];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TodoDaoMixin on DatabaseAccessor<KanzaDatabase> {
  $TaskEntityTable get taskEntity => attachedDatabase.taskEntity;
}
