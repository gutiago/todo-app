import 'package:equatable/equatable.dart';
import 'package:todo_app/database/entities/category.dart';

class HomeCategoryModel extends Equatable {
  const HomeCategoryModel(
    this.category,
    this.numberOfTasks,
    this.categoryName,
    this.percentageCompleted,
  );

  final Category category;
  final String numberOfTasks;
  final String categoryName;
  final double percentageCompleted;

  @override
  List<Object> get props => [
        category.id,
        numberOfTasks,
        categoryName,
        percentageCompleted,
      ];
}
