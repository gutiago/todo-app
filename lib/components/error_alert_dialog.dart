import 'package:flutter/material.dart';
import '../resources/strings.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Strings.errorAlertTitle),
      content: Text(message),
      actions: [
        TextButton(
          child: Text(Strings.errorActionOK),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
