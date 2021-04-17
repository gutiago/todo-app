import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/spacings.dart';
import '../resources/strings.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

  Widget _logo() {
    return Center(
      child: Column(
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
          const SizedBox(height: Spacings.x2),
          Text(
            Strings.appName,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
          )
        ],
      ),
    );
  }

  Widget _bottomLoading(BuildContext context) {
    return Positioned(
      bottom: Spacings.x7,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(backgroundColor: Colors.white),
              const SizedBox(height: Spacings.x3),
              Text(
                Strings.splashFooter,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_backgroundGradient(), _logo(), _bottomLoading(context)],
      ),
    );
  }
}
