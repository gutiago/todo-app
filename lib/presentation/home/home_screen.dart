import 'package:flutter/material.dart';
import 'package:todo_app/components/task_item.dart';
import 'package:todo_app/components/popover.dart';
import 'package:todo_app/navigation/card_page_route.dart';
import '../creation/category_pick_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FloatingActionButton(
        onPressed: () => _createTask(context),
      ),
    );
  }

  void _createTask(BuildContext context) {
    Navigator.of(context)
        .push(CardStackPageRoute(builder: (context) => CategoryPickScreen()));
  }
}
