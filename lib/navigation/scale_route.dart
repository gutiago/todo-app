import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ScaleRoute<T> extends PageRoute<T> {
  ScaleRoute({required this.builder});

  final WidgetBuilder builder;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final child = builder(context);

    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation.drive(
            Tween(begin: 0.7, end: 1.0).chain(CurveTween(curve: Curves.ease))),
        child: child,
      ),
    );
  }
}
