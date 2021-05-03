import 'package:flutter/material.dart';
import 'package:todo_app/components/button_link.dart';
import 'package:todo_app/resources/spacings.dart';
import 'package:todo_app/resources/strings.dart';
import '../../bloc/home/home_bloc.dart';
import '../../components/home/home_categories.dart';
import '../../components/home/home_header.dart';
import '../../components/home/home_tasks.dart';
import '../../database/entities/task.dart';
import '../../navigation/card_page_route.dart';
import '../../resources/app_colors.dart';
import '../creation/task_create_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.onSignOut,
    required this.onReload,
    required this.state,
    required this.onChanged,
  });

  final VoidCallback onSignOut;
  final VoidCallback onReload;
  final Function(bool value, Task task) onChanged;
  final LoadedState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(state.backgroundPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Spacings.x5),
              child: ButtonLink(
                linkText: Strings.logout,
                onLinkPressed: onSignOut,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                state.greetings,
                state.todayTasksCount,
                state.todayDate,
              ),
              const SizedBox(height: Spacings.x7),
              if (state.categories.isNotEmpty) HomeCategories(state.categories),
              if (state.todayTasks.isNotEmpty)
                HomeTasks(state.todayTasks, onChanged),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: AppColors.darkBlue),
          backgroundColor: Colors.white,
          onPressed: () => _createTask(context),
        ),
      ),
    );
  }

  void _createTask(BuildContext context) {
    Navigator.of(context)
        .push(CardStackPageRoute(builder: (context) => TaskCreateScreen()))
        .then((_) => onReload());
  }
}
