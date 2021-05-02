import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/components/task_item.dart';
import 'package:todo_app/components/popover.dart';
import 'package:todo_app/resources/spacings.dart';
import 'package:todo_app/resources/strings.dart';
import '../../navigation/card_page_route.dart';
import '../../resources/app_colors.dart';
import '../creation/task_create_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.onSignOut, required this.onReload});

  final VoidCallback onSignOut;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg_afternoon.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Spacings.x5),
              child: InkWell(
                child: Text(Strings.logout,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: onSignOut,
              ),
            )
          ],
        ),
        body: Container(),
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
