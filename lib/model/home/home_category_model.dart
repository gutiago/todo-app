import 'package:equatable/equatable.dart';
import 'package:todo_app/database/entities/category.dart';
import 'package:todo_app/database/entities/task.dart';

class HomeCategoryModel extends Equatable {
  const HomeCategoryModel(
    this.category,
    this.numberOfTasks,
    this.categoryName,
    this.percentageCompleted,
    this.tasks,
  );

  final Category category;
  final String numberOfTasks;
  final String categoryName;
  final double percentageCompleted;
  final List<Task> tasks;

  @override
  List<Object> get props => [
        category.id,
        numberOfTasks,
        categoryName,
        percentageCompleted,
        tasks,
      ];
}
