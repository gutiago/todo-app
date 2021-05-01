import 'package:flutter/material.dart';

class FormContent {
  const FormContent({
    required this.title,
    required this.hint,
    required this.icon,
    required this.validator,
  });

  final String title;
  final String hint;
  final IconData icon;
  final FormFieldValidator<String> validator;
}
