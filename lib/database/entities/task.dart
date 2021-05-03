import 'package:floor/floor.dart';

@entity
class Task {
  Task(
    this.id,
    this.categoryId,
    this.description,
    this.isComplete,
    this.createdAt,
    this.deadline,
  );

  @PrimaryKey(autoGenerate: true)
  final int id;

  final int categoryId;

  final String description;

  final bool isComplete;

  final DateTime createdAt;

  final DateTime deadline;

  Task copyWith({
    int? id,
    int? categoryId,
    String? description,
    bool? isComplete,
    DateTime? createdAt,
    DateTime? deadline,
  }) {
    return Task(
      id ?? this.id,
      categoryId ?? this.categoryId,
      description ?? this.description,
      isComplete ?? this.isComplete,
      createdAt ?? this.createdAt,
      deadline ?? this.deadline,
    );
  }
}
