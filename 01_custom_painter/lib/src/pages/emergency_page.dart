import 'package:custom_painter/src/widgets/fat_button.dart';
import 'package:custom_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  final items = <ItemBoton>[
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> ItemMap = items
        .map((item) => FatButton(
            title: item.texto,
            color1: item.color1,
            color2: item.color2,
            onPressd: () {},
            icon: item.icon))
        .toList();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 80,
                ),
                ...ItemMap
              ],
            ),
          ),
          _Head()
        ],
      ),
    );
  }
}

class _Head extends StatelessWidget {
  const _Head({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: "Assitencia medica",
          subtitle: "Solicite",
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
          right: 0,
          top: 40,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            child: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Solicite',
      title: 'Assistencia Medica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}
