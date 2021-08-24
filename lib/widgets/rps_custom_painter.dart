import 'package:flutter/material.dart';
import 'package:smoothie_juices/constants.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = kWhiteColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(size.width * 0.9900990, 0);
    path.quadraticBezierTo(size.width * 0.9849505, size.height * 0.1339604,
        size.width * 0.9755387, size.height * 0.1980198);
    path.cubicTo(
        size.width * 0.9610891,
        size.height * 0.3478218,
        size.width * 0.7780198,
        size.height * 0.3339604,
        size.width * 0.7775189,
        size.height * 0.4950495);
    path.cubicTo(
        size.width * 0.7774257,
        size.height * 0.6623762,
        size.width * 0.9581188,
        size.height * 0.6571287,
        size.width * 0.9755387,
        size.height * 0.7920792);
    path.quadraticBezierTo(size.width * 0.9878218, size.height * 0.8559406,
        size.width * 0.9900990, size.height * 0.9900990);
    path.lineTo(size.width * 0.9900990, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
