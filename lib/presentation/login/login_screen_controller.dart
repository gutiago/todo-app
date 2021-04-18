import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/login/login_screen.dart';

import '../../bloc/login/login_bloc.dart';

class LoginScreenController extends StatelessWidget {
  const LoginScreenController({
    this.onLoggedIn,
  });

  final VoidCallback onLoggedIn;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (oldState, newState) {
        return oldState != newState;
      },
      builder: (context, state) {
        if (state is ContentState) {
          return LoginScreen(
            onLoggedIn: onLoggedIn,
            content: state.content,
          );
        }

        return Container();
      },
    );
  }
}
