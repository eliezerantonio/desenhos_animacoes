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

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    ratacao = Tween(begin: 0.0, end: 2.0).animate(controller);
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
        builder: (context, chlild) {
          return Transform.rotate(angle: ratacao.value, child: _Rectangulo());
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
