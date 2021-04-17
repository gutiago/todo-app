import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/firebase_authenticator.dart';
import 'resources/routes.dart';
import 'presentation/splash_screen.dart';
import 'presentation/login/login_screen.dart';

void main() {
  runApp(CreativeApp());
}

class CreativeApp extends StatefulWidget {
  @override
  _CreativeAppState createState() => _CreativeAppState();
}

class _CreativeAppState extends State<CreativeApp> {
  final _firebaseAuthenticator = FirebaseAuthenticator();
  bool _isListeningState = false;

  void _listenToUserState(BuildContext context) {
    if (!_isListeningState) {
      _firebaseAuthenticator.userState(state: (shouldLogout) {
        if (shouldLogout) {
          Navigator.of(context).pushReplacementNamed(Routes.login);
        }
      });

      WidgetsBinding.instance.addPostFrameCallback(
          (_) => setState(() => _isListeningState = true));
    }
  }

  void _goTo(BuildContext context, String path) {
    Navigator.of(context).pushReplacementNamed(path);
  }

  void _finishedLoading(BuildContext context, String path) {
    _listenToUserState(context);
    _goTo(context, path);
  }

  Map<String, WidgetBuilder> _appRoutes() {
    return {
      Routes.initial: (context) => SplashScreen(
            onLoadFinished: (path) => _finishedLoading(context, path),
            authenticator: _firebaseAuthenticator,
          ),
      Routes.login: (context) => LoginScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initial,
      routes: _appRoutes(),
    );
  }
}
