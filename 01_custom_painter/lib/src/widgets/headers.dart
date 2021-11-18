import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        painter: _HeaderWaveGradiat(),
      ),
    );
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

class _HeaderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 40;

    final path = Path(); //parte para mover o lapiz
    path.lineTo(0, size.height * 0.20);

    path.lineTo(size.width * 0.5, size.height * 0.28);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path(); //parte para mover o lapiz
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propriedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path(); //parte para mover o lapiz
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderWaveGradiat extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 55.0), radius: 180);
    final Gradient gradient = new LinearGradient(
      colors: [
        Color(0xff6d0538),
        Color(0xffc012ff),
        Color(0xff6d05fa),
      ],
      stops: [
        0.2,
        0.5,
        1.0,
      ],
    );

    final lapiz = Paint()..shader = gradient.createShader(rect);
    //propriedades
    // lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path(); //parte para mover o lapiz
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;
  final Color whiteColor = Colors.white.withOpacity(0.7);

  IconHeader({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              this.subtitle,
              style: TextStyle(
                fontSize: 20,
                color: whiteColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25, color: whiteColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(icon, size: 80, color: Colors.white)
          ],
        )
      ],
    );
  }
}
//hey Copilot!, how are you?

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground(
      {Key key, @required this.color1, @required this.color2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Color(0xff526bf6),
            // Color(0xff67acf2),

            this.color1,
            this.color2,
          ],
        ),
      ),
    );
  }
}
