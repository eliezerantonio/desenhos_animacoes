import 'package:flutter/material.dart';

import 'src/pages/slide_show_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desenho App',
      home: SlideShowPage(),
    );
  }
}
