import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  double percent = 0.0;
  double newPercent = 0.0;
  AnimationController controller;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 8000));

    controller.addListener(() {
      percent = lerpDouble(percent, newPercent, controller.value);

      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MyRadialProgress(percent),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          percent = newPercent;
          percent += 10;

          if (newPercent > 100) {
            newPercent = 0;
            percent = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percent;
  _MyRadialProgress(this.percent);
  @override
  void paint(Canvas canvas, Size size) {
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
