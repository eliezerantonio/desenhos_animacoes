import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  const FatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _FatButtonBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              width: 40,
            ),
            FaIcon(FontAwesomeIcons.carCrash, color: Colors.white, size: 40),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "Motor Accident",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            FaIcon(FontAwesomeIcons.chevronRight,
                color: Colors.white, size: 20),
            SizedBox(
              width: 40,
            )
          ],
        )
      ],
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  const _FatButtonBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: FaIcon(
                FontAwesomeIcons.carCrash,
                color: Colors.white.withOpacity(0.2),
                size: 150,
              ),
            )
          ],
        ),
      ),
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
