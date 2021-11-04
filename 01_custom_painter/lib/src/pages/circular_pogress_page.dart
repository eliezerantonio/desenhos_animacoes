import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MyRadialProgress(),
            )),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final percent = 80;
    //ciruclo completo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    final archAngle = 2 * pi * (percent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        archAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
