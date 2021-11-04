import 'package:flutter/material.dart';

class QuadradoAnimadoPage extends StatefulWidget {
  @override
  State<QuadradoAnimadoPage> createState() => _QuadradoAnimadoPageState();
}

class _QuadradoAnimadoPageState extends State<QuadradoAnimadoPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> moverDireita;
  Animation<double> moverAcima;
  Animation<double> moverEsquerda;
  Animation<double> moverBaixo;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 4000,
      ),
    );

    moverDireita = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25),
      ),
    );

    moverAcima = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5),
      ),
    );
    moverEsquerda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75),
      ),
    );
    moverBaixo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0),
      ),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          child: Rectangulo(),
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                moverDireita.value + moverEsquerda.value,
                moverAcima.value + moverBaixo.value,
              ),
              child: child,
            );
          },
        ),
      ),
    );
  }
}

class Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
