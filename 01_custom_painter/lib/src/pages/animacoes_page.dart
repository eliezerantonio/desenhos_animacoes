import 'dart:math';

import 'package:flutter/material.dart';

class AnimacoesPage extends StatelessWidget {
  const AnimacoesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QuadradoAnimado(),
      ),
    );
  }
}

class QuadradoAnimado extends StatefulWidget {
  const QuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  State<QuadradoAnimado> createState() => _QuadradoAnimadoState();
}

class _QuadradoAnimadoState extends State<QuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> ratacao;
  Animation<double> opacidade;
  Animation<double> opacidadeOut;
  Animation<double> moverDireita;
  Animation<double> aumentar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    ratacao = Tween(begin: 0.0, end: 2.0 * pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacidade = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0,
          0.25,
          curve: Curves.easeOutCirc,
        ),
      ),
    );
    opacidadeOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.75,
        1.0,
        curve: Curves.easeOut,
      ),
    ));
    moverDireita = Tween(begin: 0.0, end: 200.0).animate(controller);

    aumentar = Tween(begin: 0.0, end: 2.0).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
      }
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
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        child: _Rectangulo(),
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(moverDireita.value, 0),
            child: Transform.rotate(
              angle: ratacao.value,
              child: Opacity(
                opacity: opacidade.value - opacidadeOut.value,
                child: Transform.scale(
                  scale: aumentar.value,
                  child: child,
                ),
              ),
            ),
          );
        });
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
