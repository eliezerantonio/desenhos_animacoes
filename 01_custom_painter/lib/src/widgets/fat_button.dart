import 'package:flutter/material.dart';

class FatButton extends StatelessWidget {
  const FatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FatButtonBackground();
  }
}

class _FatButtonBackground extends StatelessWidget {
  const _FatButtonBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Color(0xff6989f5),
            Color(0xff906ef5),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}
