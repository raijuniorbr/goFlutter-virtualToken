import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularTimerPainter extends CustomPainter {
  CircularTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CircularTimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}

class ProgressPainter extends CustomPainter {
  final double value;

  ProgressPainter({required this.value});

  Paint backgroundPaint = Paint()
    ..color = Colors.blue[900]!
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  Paint valuePaint = Paint()
    ..color = Colors.white10
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  @override
  void paint(Canvas canvas, Size size) {
    Path backgroundPath = Path();
    Path valuePath = Path();

    backgroundPath.moveTo(0, size.height / 2);
    backgroundPath.lineTo(size.width, size.height / 2);

    valuePath.moveTo(0, size.height / 2);
    valuePath.lineTo(size.width * value, size.height / 2);

    canvas.drawPath(backgroundPath, backgroundPaint);
    canvas.drawPath(valuePath, valuePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
