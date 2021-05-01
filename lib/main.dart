import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/firebase_authenticator.dart';
import 'resources/routes.dart';
import 'bloc/login/login_bloc.dart';
import 'presentation/splash_screen.dart';
import 'presentation/login/login_screen_controller.dart';
import 'presentation/home/home_screen.dart';
import 'navigation/fade_route.dart';

void main() {
  runApp(CreativeApp());
}

class CreativeApp extends StatefulWidget {
  @override
  _CreativeAppState createState() => _CreativeAppState();
}

class _CreativeAppState extends State<CreativeApp> {
  final _firebaseAuthenticator = FirebaseAuthenticator();

  void _goTo(BuildContext context, String path) {
    Navigator.of(context).pushReplacementNamed(path);
  }

  void _finishedLoading(BuildContext context, String path) {
    _goTo(context, path);
  }

  Route<dynamic> _appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return CupertinoPageRoute(
            builder: (context) => SplashScreen(
                  onLoadFinished: (path) => _finishedLoading(context, path),
                  authenticator: _firebaseAuthenticator,
                ),
            settings: settings);
      case Routes.login:
        return CupertinoPageRoute(
            builder: (context) => _loginScreen(context), settings: settings);
      default:
        return FadeRoute(HomeScreen());
    }
  }

  Widget _loginScreen(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authenticator: _firebaseAuthenticator)
          ..add(FillScreenContentEvent()),
        child: Builder(
          builder: (context) {
            return LoginScreenController(
              onLoggedIn: () {},
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initial,
      onGenerateRoute: _appRoutes,
    );
  }
}
