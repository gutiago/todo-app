part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  Stream<HomeState> applyAsync(HomeBloc bloc);

  @override
  List<Object> get props => [];
}

@immutable
class LoadContentEvent extends HomeEvent {
  LoadContentEvent();

  @override
  Stream<HomeState> applyAsync(HomeBloc bloc) async* {
    yield InitialState();

    final db = await AppDatabase.appDatabase;
    final categories = await db.categoryDao.findAllCategories();
    final tasks = await db.taskDao.findAllTasks();
    final greetingsMessage = _currentGreetings();
    final tasksToPerformToday = _todayTasks(tasks);
    final taskCountMessage = Strings.todayTasks(tasksToPerformToday.length);
    final todayDateFormatted = Strings.todayDate(_currentDateFormatted());
    final categoriesModel = _allModelCategories(categories, tasks);

    yield LoadedState(
      greetingsMessage,
      taskCountMessage,
      todayDateFormatted,
      _backgroundPath(),
      tasksToPerformToday,
      categoriesModel,
    );
  }

  String _currentDateFormatted() => DateFormat('d/MM/y').format(DateTime.now());

  String _currentGreetings() {
    var timeNow = DateTime.now().hour;

    if (timeNow < 12) {
      return Strings.morning;
    } else if ((timeNow >= 12) && (timeNow <= 18)) {
      return Strings.afternoon;
    } else {
      return Strings.night;
    }
  }

  String _backgroundPath() {
    var timeNow = DateTime.now().hour;

    if (timeNow < 12) {
      return 'images/bg_day.png';
    } else if ((timeNow >= 12) && (timeNow <= 18)) {
      return 'images/bg_afternoon.png';
    } else {
      return 'images/bg_night.png';
    }
  }

  List<Task> _todayTasks(List<Task> tasks) {
    final currentDate = DateTime.now();

    return tasks
        .where((task) => currentDate.difference(task.deadline).inDays == 0)
        .toList();
  }

  List<HomeCategoryModel> _allModelCategories(
    List<Category> categories,
    List<Task> tasks,
  ) {
    var allCategoriesModel = <HomeCategoryModel>[];
    for (Category currentCategory in categories) {
      final categoryTasks =
          tasks.where((e) => e.categoryId == currentCategory.id);
      final allCompleted = tasks.where((e) => e.isComplete);

      final percentageCompleted = allCompleted.length / categoryTasks.length;

      final model = HomeCategoryModel(
        currentCategory,
        Strings.numberOfTasks(categoryTasks.length),
        currentCategory.name,
        percentageCompleted,
        categoryTasks.toList(),
      );

      allCategoriesModel.add(model);
    }
    return allCategoriesModel;
  }
}

@immutable
class UpdateTaskEvent extends HomeEvent {
  UpdateTaskEvent(this.isComplete, this.task);

  final bool isComplete;
  final Task task;

  @override
  Stream<HomeState> applyAsync(HomeBloc bloc) async* {
    final newTask = task.copyWith(isComplete: isComplete);
    final db = await AppDatabase.appDatabase;
    await db.taskDao.updateTask(newTask);
    bloc..add(LoadContentEvent());
  }
}
