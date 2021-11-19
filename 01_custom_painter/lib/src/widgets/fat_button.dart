import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color1;
  final Color color2;
  final Function onPressd;

  const FatButton({
    Key key,
    this.icon = FontAwesomeIcons.carCrash,
    @required this.title,
    this.color1 = Colors.deepOrangeAccent,
    this.color2 = Colors.blueAccent,
    @required this.onPressd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressd,
      child: Stack(
        children: [
          _FatButtonBackground(
            icon: this.icon,
            color1: color1,
            color2: color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(this.icon, color: Colors.white, size: 40),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  this.title,
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
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;
  const _FatButtonBackground({Key key, this.icon, this.color1, this.color2})
      : super(key: key);
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
                this.icon,
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
            color1,
            color2,
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
