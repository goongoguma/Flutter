import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Todo({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
