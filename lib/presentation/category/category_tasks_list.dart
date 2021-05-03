import 'package:flutter/material.dart';
import 'package:todo_app/components/task_item.dart';
import '../../components/empty_list.dart';
import '../../database/entities/task.dart';
import '../../model/home/home_category_model.dart';
import '../../resources/app_colors.dart';
import '../../resources/spacings.dart';
import 'category_tasks_presenter.dart';

class CategoryTasksList extends StatefulWidget {
  const CategoryTasksList(
    this.model, {
    this.presenter = const CategoryTasksPresenter(),
  });

  final HomeCategoryModel model;
  final CategoryTasksPresenter presenter;

  @override
  _CategoryTasksListState createState() => _CategoryTasksListState();
}

class _CategoryTasksListState extends State<CategoryTasksList> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = widget.model.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        leading: CloseButton(),
        title: Text(widget.model.categoryName),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: tasks.isEmpty ? EmptyList() : _taskList(context),
      ),
    );
  }

  Widget _taskList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Spacings.x2, vertical: Spacings.x4),
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              child: TaskItem(
                title: tasks[index].description,
                onChanged: (isComplete) => _updateTask(
                  isComplete,
                  widget.model.tasks[index],
                ),
                completed: tasks[index].isComplete,
              ),
            );
          }),
    );
  }

  void _updateTask(bool isComplete, Task task) async {
    final updatedTask = await widget.presenter.updateTask(isComplete, task);
    final index = tasks.indexOf(task);
    setState(() {
      tasks[index] = updatedTask;
    });
  }
}
