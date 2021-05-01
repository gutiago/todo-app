import 'package:flutter/material.dart';
import 'package:todo_app/components/task_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TaskItem(id: '1', title: 'Comer panqueca', onChanged: (a, b) {})
        ],
      ),
    );
  }
}
