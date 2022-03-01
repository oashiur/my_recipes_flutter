import 'package:flutter/material.dart';

class MyCategory {
  final String id;
  final String title;
  final Color color;

  MyCategory({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
