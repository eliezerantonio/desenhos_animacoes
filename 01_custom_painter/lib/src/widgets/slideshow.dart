import 'package:custom_painter/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool pointsAbove;
  final Color primaryColor;
  final Color secudaryColor;
  Slideshow({
    @required this.slides,
    this.pointsAbove = false,
    this.primaryColor = Colors.blue,
    this.secudaryColor = Colors.grey,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (this.pointsAbove)
                _Dots(this.slides.length, primaryColor, secudaryColor),
              Expanded(child: _Slides(this.slides)),
              if (!this.pointsAbove)
                _Dots(this.slides.length, primaryColor, secudaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color primaryColor;
  final Color secudaryColor;
  _Dots(this.totalSlides, this.primaryColor, this.secudaryColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides,
            (index) => _Dot(index, primaryColor, secudaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  _Dot(this.index, this.primaryColor, this.secudaryColor);
  final int index;
  final Color primaryColor;
  final Color secudaryColor;
  @override
  Widget build(BuildContext context) {
    final pageViewIndex = context.watch<SliderModel>().currentPage;
    final condition =
        (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: condition ? 20 : 14,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: condition ? 20 : 14,
      decoration: BoxDecoration(
        color: condition ? primaryColor : secudaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      //update provider

      context.read<SliderModel>().currentPage = pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageViewController,
          physics: BouncingScrollPhysics(),
          children: widget.slides.map((slide) => _Slide(slide)).toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
