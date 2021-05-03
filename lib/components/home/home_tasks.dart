import 'package:flutter/material.dart';
import '../../components/task_item.dart';
import '../../database/entities/task.dart';
import '../../resources/spacings.dart';
import '../../resources/strings.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks(this.todayTasks, this.onChanged);

  final List<Task> todayTasks;
  final Function(bool value, Task task) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x3),
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
                itemCount: todayTasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: TaskItem(
                      completed: todayTasks[index].isComplete,
                      title: todayTasks[index].description,
                      onChanged: (value) => onChanged(value, todayTasks[index]),
                    ),
                  );
                }),
          ),
          const SizedBox(height: Spacings.x20),
        ],
      ),
    );
  }
}
