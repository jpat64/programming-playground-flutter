// ignore_for_file: file_names

import 'package:programming_playground/models/CoolThing.dart';

class Book extends CoolThing {
  final int downloads;

  const Book({
    required super.name,
    required super.subtitle,
    required this.downloads,
  });
}
