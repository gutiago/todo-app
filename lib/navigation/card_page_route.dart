import 'package:flutter/widgets.dart';

import '../resources/card_clipper.dart';
import 'card_stack_transition.dart';

class CardStackPageRoute<T> extends PageRoute<T> {
  CardStackPageRoute({
    RouteSettings? settings,
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = false,
    this.barrierDismissible = true,
    Color barrierColor = const Color(0xCC000000),
    this.barrierLabel,
    this.maintainState = true,
    this.radius = 16.0,
    this.shadow = const BoxShadow(
      color: Color(0x26000000), // black with 15% alpha
      offset: Offset(0, -2),
      blurRadius: 8.0,
    ),
    this.topDistance,
    this.stackedCardScale,
  })  : _barrierColor = barrierColor,
        super(settings: settings);

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  Color? get barrierColor => _addBarrier ? _barrierColor : null;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  final double radius;
  final BoxShadow shadow;
  final double? topDistance;
  final double? stackedCardScale;

  final Color _barrierColor;

  bool _addBarrier = true;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    final canTransition = previousRoute is CardStackPageRoute;
    if (canTransition) _addBarrier = false;
    return canTransition;
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) =>
      nextRoute is CardStackPageRoute;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    var child = builder(context);

    return child = DecoratedBox(
      decoration: BoxDecoration(boxShadow: [shadow]),
      child: ClipPath(
        clipper: CardClipper(radius: radius),
        child: child,
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      CardStackTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        topDistance: topDistance,
        stackedCardScale: stackedCardScale,
        child: child,
      );
}
