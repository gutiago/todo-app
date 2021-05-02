import '../../../database/app_database.dart';
import '../../../database/entities/category.dart';
import '../../../database/entities/task.dart';

class TaskCreatePresenter {
  const TaskCreatePresenter();

  Future createTask(String name, Category category) {
    final task = Task(
      DateTime.now().millisecond,
      category.id,
      name,
      false,
      DateTime.now(),
    );
    return AppDatabase.appDatabase
        .then((db) => db.taskDao.insertTask(task))
        .then((_) => task);
  }
}
