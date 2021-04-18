import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/firebase_authenticator.dart';
import 'resources/routes.dart';
import 'bloc/login/login_bloc.dart';
import 'presentation/splash_screen.dart';
import 'presentation/login/login_screen_controller.dart';

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
      Routes.login: (context) => _loginScreen(context),
    };
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
      routes: _appRoutes(),
    );
  }
}
