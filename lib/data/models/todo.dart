import 'package:flutter/foundation.dart';

import './todo_category.dart';

class Todo {
  const Todo({
    @required this.id,
    @required this.title,
    this.details,
    this.dateTime,
    this.isDone = false,
    this.category,
  });

  final String id;
  final String title;
  final String details;
  final String dateTime;
  final bool isDone;
  final TodoCategory category;

  @override
  String toString() => '''{ TODO
  title: $title,
  details: $details,
  dateTime: $dateTime,
  isDone: $isDone,
  category: $category,
  }''';
}
