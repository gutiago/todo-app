import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

const _defaultTextStyle = TextStyle(
  color: AppColors.darkBlue,
  fontWeight: FontWeight.bold,
);

class Button extends StatelessWidget {
  const Button({
    required this.text,
    this.onPressed,
    this.height = 50,
    this.radius = 25,
    this.expand = true,
    this.primaryColor = Colors.white,
    this.disabledColor,
    this.textStyle = _defaultTextStyle,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double radius;
  final bool expand;
  final Color primaryColor;
  final Color? disabledColor;
  final TextStyle textStyle;
  final bool isLoading;

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
        child: isLoading
            ? SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                    backgroundColor: Colors.white, strokeWidth: 2.0))
            : Text(text, style: textStyle),
      ),
    );
  }
}
