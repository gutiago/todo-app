import '../../database/entities/task.dart';

class HomeMainModel {
  const HomeMainModel(
    this.greetings,
    this.todayTasksCount,
    this.todayDate,
    this.backgroundPath,
    this.todayTasks,
  );

  final String greetings;
  final String todayTasksCount;
  final String todayDate;
  final String backgroundPath;
  final List<Task> todayTasks;
}
