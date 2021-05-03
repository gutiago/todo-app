import '../components/external/circular_check_box.dart';
import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

class TaskItem extends StatefulWidget {
  TaskItem({
    required this.title,
    required this.onChanged,
    this.completed = true,
  });

  final String title;
  final Function(bool value) onChanged;
  final bool completed;

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.completed;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _didChangeValue,
      leading: CircularCheckBox(
        fillColor: MaterialStateProperty.all(AppColors.enabledColor),
        value: _value,
        onChanged: (bool? value) => _didChangeValue(),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 15.0,
          color: _value ? AppColors.disabledColor : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _didChangeValue() {
    setState(() {
      _value = !_value;
      widget.onChanged(_value);
    });
  }
}
