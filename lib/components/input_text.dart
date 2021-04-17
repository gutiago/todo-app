import 'package:flutter/material.dart';
import 'package:todo_app/resources/spacings.dart';
import '../resources/app_colors.dart';

class InputText extends StatefulWidget {
  const InputText({
    this.title,
    this.hintText,
    this.icon,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String title;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String> validator;

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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Spacings.x2),
        Container(
          height: 50.0,
          child: TextFormField(
            controller: widget.controller,
            cursorColor: Colors.white,
            obscureText: widget.obscureText,
            validator: widget.validator,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.white.withOpacity(0.3),
              ),
              fillColor: AppColors.lightBlue,
              filled: true,
              prefixIcon:
                  Icon(widget.icon, color: Colors.white.withOpacity(0.8)),
              border: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 25,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
