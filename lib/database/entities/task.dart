import 'package:floor/floor.dart';

@entity
class Task {
  Task(
    this.id,
    this.categoryId,
    this.description,
    this.isComplete,
    this.createdAt,
  );

  @PrimaryKey(autoGenerate: true)
  final int id;

  final int categoryId;

  final String description;

  final bool isComplete;

  final DateTime createdAt;
}
