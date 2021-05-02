import 'package:flutter/material.dart';
import 'package:todo_app/resources/spacings.dart';
import '../resources/app_colors.dart';

class InputText extends StatefulWidget {
  const InputText({
    required this.title,
    required this.hintText,
    this.icon,
    required this.controller,
    this.obscureText = false,
    required this.validator,
    this.fillColor = AppColors.lightBlue,
    this.textColor = Colors.white,
  });

  final String title;
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final Color? fillColor;
  final Color? textColor;

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 15.0,
            color: widget.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Spacings.x2),
        Container(
          constraints: BoxConstraints(
            minHeight: 50,
          ),
          child: TextFormField(
            controller: widget.controller,
            cursorColor: widget.textColor,
            obscureText: widget.obscureText,
            validator: widget.validator,
            style: TextStyle(
              fontSize: 15.0,
              color: widget.textColor,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: widget.textColor?.withOpacity(0.3),
              ),
              errorStyle: TextStyle(
                fontSize: 14.0,
                color: AppColors.errorRed,
              ),
              fillColor: widget.fillColor,
              filled: true,
              prefixIcon: (widget.icon != null)
                  ? Icon(widget.icon, color: Colors.white.withOpacity(0.8))
                  : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
