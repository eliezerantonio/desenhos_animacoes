import 'package:custom_painter/src/pages/animacoes_page.dart';
import 'package:custom_painter/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

import 'src/retos/quadrado_animado_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desenho App',
      home: QuadradoAnimadoPage(),
    );
  }
}
