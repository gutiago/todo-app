part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

@immutable
class InitialState extends HomeState {
  const InitialState();

  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  const LoadedState(
    this.greetings,
    this.todayTasksCount,
    this.todayDate,
    this.backgroundPath,
    this.todayTasks,
    this.categories,
  );

  final String greetings;
  final String todayTasksCount;
  final String todayDate;
  final String backgroundPath;
  final List<Task> todayTasks;
  final List<HomeCategoryModel> categories;

  @override
  List<Object> get props => [
        greetings,
        todayTasksCount,
        todayDate,
        backgroundPath,
        todayTasks,
        categories,
      ];
}
