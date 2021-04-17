import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

const _defaultTextStyle = TextStyle(
  color: AppColors.darkBlue,
  fontWeight: FontWeight.bold,
);

class Button extends StatelessWidget {
  const Button({
    @required this.text,
    this.onPressed,
    this.height = 50,
    this.radius = 25,
    this.expand = true,
    this.primaryColor = Colors.white,
    this.disabledColor,
    this.textStyle = _defaultTextStyle,
  });

  final String text;
  final VoidCallback onPressed;
  final double height;
  final double radius;
  final bool expand;
  final Color primaryColor;
  final Color disabledColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: expand ? double.maxFinite : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.withOpacity(0.7),
          primary: primaryColor,
          onSurface: disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
