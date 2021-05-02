import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FadeRoute<T> extends PageRoute<T> {
  FadeRoute({required this.builder});

  final WidgetBuilder builder;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final child = builder(context);

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
