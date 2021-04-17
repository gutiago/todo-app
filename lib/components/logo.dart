import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/spacings.dart';
import '../resources/strings.dart';

class Logo extends StatelessWidget {
  const Logo({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 45.0,
          child: Icon(
            Icons.fact_check_outlined,
            color: AppColors.lightBlue,
            size: 45.0,
          ),
        ),
        const SizedBox(height: Spacings.x3),
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0),
        )
      ],
    );
  }
}
