import 'package:flutter/material.dart';
import 'package:todo_app/resources/spacings.dart';
import '../resources/app_colors.dart';

class InputText extends StatelessWidget {
  const InputText({this.title, this.hintText, this.icon, this.controller});

  final String title;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Spacings.x2),
        Container(
          height: 50.0,
          child: TextField(
            controller: controller,
            cursorColor: Colors.white,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.white.withOpacity(0.3),
              ),
              fillColor: AppColors.lightBlue,
              filled: true,
              prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.8)),
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
