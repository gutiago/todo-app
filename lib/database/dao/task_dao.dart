import 'package:floor/floor.dart';
import '../entities/task.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> findAllTasks();

  @Query('SELECT * FROM Task WHERE categoryId = :id')
  Future<List<Task>> findAllTasksFromCategory(int id);

  @insert
  Future<void> insertTask(Task task);

  @delete
  Future<void> deleteTask(Task task);
}
