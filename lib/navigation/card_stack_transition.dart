import 'dart:math';

import 'package:flutter/widgets.dart';

class CardStackTransition extends StatelessWidget {
  const CardStackTransition({
    Key? key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
    double? topDistance,
    double? stackedCardScale,
  })  : topDistance = topDistance ?? 8.0,
        stackedCardScale = stackedCardScale ?? 0.95,
        super(key: key);

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;
  final double topDistance;
  final double stackedCardScale;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final maxHeight =
        max(query.size.height - query.viewPadding.top - topDistance, 0.0);

    // transitioning in and out
    final bottomUpTween = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    );
    Widget newChild = SlideTransition(
      position: animation.drive(bottomUpTween),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: maxHeight, maxHeight: maxHeight),
        child: child,
      ),
    );

    // transitioning up (stack)
    final scaleTween = Tween<double>(begin: 1.0, end: stackedCardScale);
    final bottomUpOutTween = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -topDistance / maxHeight),
    );
    newChild = SlideTransition(
      position: secondaryAnimation.drive(bottomUpOutTween),
      child: ScaleTransition(
        scale: secondaryAnimation.drive(scaleTween),
        alignment: Alignment.topCenter,
        child: newChild,
      ),
    );

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Align(alignment: Alignment.bottomCenter, child: newChild),
    );
  }
}
