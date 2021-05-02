import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/navigation/card_page_route.dart';
import '../../database/entities/category.dart';
import '../../components/button.dart';
import '../../components/error_alert_dialog.dart';
import '../../components/input_text.dart';
import '../../resources/app_colors.dart';
import '../../resources/spacings.dart';
import '../../resources/strings.dart';
import 'presenter/task_create_presenter.dart';
import 'category_pick_screen.dart';

class TaskCreateScreen extends StatefulWidget {
  TaskCreateScreen({
    this.presenter = const TaskCreatePresenter(),
  });

  final TaskCreatePresenter presenter;

  @override
  _TaskCreateScreenState createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;
  bool _isLoading = false;
  Category? _category;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        leading: CloseButton(),
        title: Text(Strings.createTaskTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacings.x5,
          vertical: Spacings.x6,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputText(
                  title: Strings.createTaskFieldTitle,
                  hintText: Strings.createTaskFieldHint,
                  controller: _controller,
                  fillColor: Colors.grey[200],
                  textColor: Colors.grey[800],
                  validator: _validator),
              const SizedBox(height: Spacings.x4),
              _categorySection(context),
              const SizedBox(height: Spacings.x10),
              Button(
                text: Strings.createTaskButtonTitle,
                onPressed: () => _createButtonPressed(context),
                primaryColor: AppColors.darkBlue,
                isLoading: _isLoading,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.createTaskError;
    }
    return null;
  }

  Widget _categorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.createTaskCategoryFieldTitle,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Spacings.x2),
        Row(
          children: [
            if (_category != null)
              Padding(
                padding: const EdgeInsets.only(right: Spacings.x3),
                child: Text(
                  _category!.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            Button(
              text: Strings.createTaskAddCategory,
              expand: false,
              onPressed: () => _pickCategory(context),
            )
          ],
        ),
      ],
    );
  }

  void _createButtonPressed(BuildContext context) async {
    if (_category != null && (_formKey.currentState?.validate() ?? false)) {
      try {
        _setLoading(true);

        final task =
            await widget.presenter.createTask(_controller.text, _category!);

        _setLoading(false);

        Navigator.of(context).pop(task);
      } catch (e) {
        _setLoading(true);
        _showError(context);
      }
    }
  }

  void _showError(BuildContext context) => showDialog(
        context: context,
        builder: (context) => ErrorAlertDialog(
          message: Strings.errorCreateTaskMessage,
        ),
      );

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _pickCategory(BuildContext context) {
    Navigator.of(context)
        .push(CardStackPageRoute(builder: (context) => CategoryPickScreen()))
        .then(_checkNewCategory);
  }

  void _checkNewCategory(dynamic? result) {
    if (result != null && result is Category) {
      setState(() => _category = result);
    }
  }
}
