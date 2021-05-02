import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/navigation/fade_route.dart';
import '../../auth/firebase_authenticator.dart';
import '../../bloc/home/home_bloc.dart';
import 'home_screen.dart';

class HomeScreenController extends StatelessWidget {
  const HomeScreenController(this.authenticator);

  final FirebaseAuthenticator authenticator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (oldState, newState) {
        return oldState != newState;
      },
      builder: (context, state) {
        if (state is LoadedState) {
          return HomeScreen(
            onSignOut: () => _trySignOut(context),
            onReload: () => _reloadScreen(context),
          );
        }

        return Container();
      },
    );
  }

  void _trySignOut(
    BuildContext context,
  ) {
    authenticator.logout().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(
            FadeRoute(builder: (context) => CreativeApp()), (route) => false));
  }

  void _reloadScreen(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(LoadContentEvent());
  }
}
