  import 'package:custom_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: HeaderDiagonal(),
    ));
  }
}
