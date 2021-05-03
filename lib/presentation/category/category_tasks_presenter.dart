import '../../database/app_database.dart';
import '../../database/entities/task.dart';

class CategoryTasksPresenter {
  const CategoryTasksPresenter();

  Future<Task> updateTask(bool isComplete, Task task) {
    final updatedTask = task.copyWith(isComplete: isComplete);
    return AppDatabase.appDatabase
        .then((db) => db.taskDao.updateTask(updatedTask))
        .then((value) => updatedTask);
  }
}
