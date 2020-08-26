import 'package:flutter/material.dart';

class TodoCategory {
  const TodoCategory({
    @required this.title,
    @required this.color,
  });

  final String title;
  final Color color;

  @override
  String toString() => '''{ TODO-Category
  title: $title,
  color: $color,
  }''';
}
