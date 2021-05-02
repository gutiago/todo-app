import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../auth/firebase_authenticator.dart';
import '../resources/app_colors.dart';
import '../resources/routes.dart';
import '../resources/spacings.dart';
import '../resources/strings.dart';
import '../components/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    required this.onLoadFinished,
    required this.authenticator,
  });

  final Function(String path) onLoadFinished;
  final FirebaseAuthenticator authenticator;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _performAsyncChecks();
  }

  String get _initialRoute =>
      widget.authenticator.isSignedIn() ? Routes.home : Routes.login;

  void _performAsyncChecks() async {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      await Firebase.initializeApp();
      widget.onLoadFinished(_initialRoute);
    });
  }

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
    return Center(child: Logo(title: Strings.appName));
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
