import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });
}
