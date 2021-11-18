import 'package:flutter/material.dart';

import 'src/labs/slide_show_page.dart';
import 'src/pages/emergency_page.dart';
import 'src/pages/pinterest_page.dart';
import 'src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desenho App',
      home: EmergencyPage(),
    );
  }
}
