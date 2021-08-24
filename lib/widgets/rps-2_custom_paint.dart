import 'package:flutter/material.dart';
import 'package:smoothie_juices/constants.dart';

class RPS2CustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = kWhiteColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9405941, size.height * 0.8910891);
    path_0.quadraticBezierTo(size.width * 0.8962871, size.height * 0.8911881,
        size.width * 0.8415842, size.height * 0.8910891);
    path_0.cubicTo(
        size.width * 0.6292079,
        size.height * 0.8029703,
        size.width * 0.6789604,
        size.height * 0.2373267,
        size.width * 0.4950495,
        size.height * 0.1980198);
    path_0.cubicTo(
        size.width * 0.3094554,
        size.height * 0.2371287,
        size.width * 0.3304455,
        size.height * 0.8028713,
        size.width * 0.1485149,
        size.height * 0.8910891);
    path_0.quadraticBezierTo(size.width * 0.1114851, size.height * 0.8875248,
        size.width * 0.0495050, size.height * 0.8910891);
    path_0.lineTo(size.width * 0.9405941, size.height * 0.8910891);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
