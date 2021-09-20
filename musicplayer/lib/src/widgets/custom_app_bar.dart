import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(FontAwesomeIcons.chevronLeft),
            Spacer(),
            Icon(FontAwesomeIcons.commentAlt),
            SizedBox(width: 20),
            Icon(FontAwesomeIcons.headphonesAlt),
            SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.externalLinkAlt,
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
