import 'package:custom_painter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Slideshow(
        pointsAbove: false,
        primaryColor: Colors.white,
        secundaryColor: Colors.grey,
        slides: [
          SvgPicture.asset("assets/slide-1.svg"),
          SvgPicture.asset("assets/slide-2.svg"),
          SvgPicture.asset("assets/slide-3.svg"),
          SvgPicture.asset("assets/slide-4.svg"),
          SvgPicture.asset("assets/slide-5.svg"),
        ],
      ),
    );
  }
}
