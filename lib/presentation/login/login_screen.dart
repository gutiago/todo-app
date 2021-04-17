import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';

class LoginScreen extends StatelessWidget {
  Widget _backgroundGradient() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: AppColors.gradientSet,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_backgroundGradient()],
      ),
    );
  }
}
