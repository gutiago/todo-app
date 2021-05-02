import 'package:flutter/material.dart';
import '../../components/button.dart';
import '../../components/error_alert_dialog.dart';
import '../../components/input_text.dart';
import '../../resources/app_colors.dart';
import '../../resources/spacings.dart';
import '../../resources/strings.dart';
import 'presenter/category_create_presenter.dart';

class CategoryCreatePopover extends StatefulWidget {
  CategoryCreatePopover({
    this.presenter = const CategoryCreatePresenter(),
  });

  final CategoryCreatePresenter presenter;

  @override
  _CategoryCreatePopoverState createState() => _CategoryCreatePopoverState();
}

class _CategoryCreatePopoverState extends State<CategoryCreatePopover> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x5),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(Strings.createCategory,
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: Spacings.x2),
            InputText(
                title: Strings.createCategoryTitle,
                hintText: Strings.createCategoryHint,
                controller: _controller,
                fillColor: Colors.grey[200],
                textColor: Colors.grey[800],
                validator: _validator),
            const SizedBox(height: Spacings.x2),
            Button(
              text: Strings.createCategory,
              onPressed: () => _createButtonPressed(context),
              primaryColor: AppColors.darkBlue,
              isLoading: _isLoading,
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Spacings.x6),
          ],
        ),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.createCategoryError;
    }
    return null;
  }

  void _createButtonPressed(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        _setLoading(true);

        final category =
            await widget.presenter.createCategory(_controller.text);

        _setLoading(false);

        Navigator.of(context).pop(category);
      } catch (e) {
        _setLoading(true);
        _showError(context);
      }
    }
  }

  void _showError(BuildContext context) => showDialog(
        context: context,
        builder: (context) => ErrorAlertDialog(
          message: Strings.errorCreateCategoryMessage,
        ),
      );

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }
}
