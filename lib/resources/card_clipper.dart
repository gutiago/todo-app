import 'dart:math';

import 'package:flutter/widgets.dart';

class CardClipper extends CustomClipper<Path> {
  const CardClipper({this.radius = 100.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final path = Path();
    final minSize = min(size.width, size.height);
    final effectiveRadius = min(minSize, radius);
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final topL = rect.topLeft;
    final topR = rect.topRight;
    final botL = rect.bottomLeft;
    final botR = rect.bottomRight;

    final p0 = Offset(effectiveRadius, 0.0);
    final p1 = Offset(size.width - effectiveRadius, 0.0);
    final p2 = Offset(size.width, effectiveRadius);
    final p3 = Offset(size.width, size.height - effectiveRadius);
    final p4 = Offset(size.width, size.height);
    final p5 = Offset(0.0, size.height);
    final p6 = Offset(0.0, size.height);
    final p7 = Offset(0.0, effectiveRadius);

    return path
      ..moveTo(p0.dx, p1.dy)
      ..lineTo(p1.dx, p1.dy)
      ..cubicTo(topR.dx, topR.dy, topR.dx, topR.dy, p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..cubicTo(botR.dx, botR.dy, botR.dx, botR.dy, p4.dx, p4.dy)
      ..lineTo(p5.dx, p5.dy)
      ..cubicTo(botL.dx, botL.dy, botL.dx, botL.dy, p6.dx, p6.dy)
      ..lineTo(p7.dx, p7.dy)
      ..cubicTo(topL.dx, topL.dy, topL.dx, topL.dy, p0.dx, p0.dy)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    if (oldClipper is CardClipper) return oldClipper.radius != radius;
    return true;
  }
}
