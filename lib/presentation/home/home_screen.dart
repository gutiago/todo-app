import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/components/button_link.dart';
import 'package:todo_app/components/task_item.dart';
import 'package:todo_app/components/popover.dart';
import 'package:todo_app/resources/spacings.dart';
import 'package:todo_app/resources/strings.dart';
import '../../bloc/home/home_bloc.dart';
import '../../navigation/card_page_route.dart';
import '../../resources/app_colors.dart';
import '../creation/task_create_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.onSignOut,
    required this.onReload,
    required this.state,
  });

  final VoidCallback onSignOut;
  final VoidCallback onReload;
  final LoadedState state;

  Widget _topContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: Spacings.x4),
            child: Icon(
              Icons.account_circle,
              size: 45.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacings.x1),
            child: Text(
              state.greetings,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Text(
            state.todayTasksCount,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: Spacings.x7),
            child: Text(
              state.todayDate,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    return Container(
      height: 350.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(Spacings.x2),
            child: Card(
              child: Container(
                width: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.category_outlined, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Spacings.x2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Spacings.x2, vertical: Spacings.x1),
                            child: Text(
                              state.categories[index].numberOfTasks,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Spacings.x2, vertical: Spacings.x1),
                            child: Text(
                              state.categories[index].categoryName,
                              style: TextStyle(fontSize: 28.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Spacings.x2),
                            child: LinearProgressIndicator(
                                value: state
                                    .categories[index].percentageCompleted),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacings.x2)),
            ),
          );
        },
      ),
    );
  }

  Widget _allTasks() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.todayTaskSection,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Spacings.x3),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.todayTasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: TaskItem(
                      completed: state.todayTasks[index].isComplete,
                      id: state.todayTasks[index].id,
                      title: state.todayTasks[index].description,
                      onChanged: (value, id) {},
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

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
              _topContent(),
              const SizedBox(height: Spacings.x5),
              _categories(),
              const SizedBox(height: Spacings.x5),
              _allTasks(),
              const SizedBox(height: Spacings.x20),
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
