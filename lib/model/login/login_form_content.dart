import 'package:flutter/material.dart';

class FormContent {
  const FormContent({
    this.title,
    this.hint,
    this.icon,
    this.validator,
  });

  final String title;
  final String hint;
  final IconData icon;
  final FormFieldValidator<String> validator;
}
