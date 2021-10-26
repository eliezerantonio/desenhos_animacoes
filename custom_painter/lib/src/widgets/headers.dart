import 'package:flutter/material.dart';

class HeaderCuandrado extends StatelessWidget {
  const HeaderCuandrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
    );
  }
}

class HeaderBorderRodondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderTriangulo(),
        ));
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = Path(); //parte para mover o lapiz

    path.moveTo(0, size.height * 0.37);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 40;

    final path = Path(); //parte para mover o lapiz
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
