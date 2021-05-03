import '../components/external/circular_check_box.dart';
import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

class TaskItem extends StatelessWidget {
  TaskItem({
    required this.title,
    required this.onChanged,
    this.completed = true,
  });

  final String title;
  final Function(bool value) onChanged;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _didChangeValue,
      leading: CircularCheckBox(
        fillColor: MaterialStateProperty.all(AppColors.enabledColor),
        value: completed,
        onChanged: (bool? value) => _didChangeValue(),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15.0,
          color: completed ? AppColors.disabledColor : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _didChangeValue() {
    onChanged(!completed);
  }
}
