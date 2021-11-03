import 'package:flutter/material.dart';

class AnimacoesPage extends StatelessWidget {
  const AnimacoesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
