import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool pointsAbove;
  final Color primaryColor;
  final Color secundaryColor;
  Slideshow({
    @required this.slides,
    this.pointsAbove = false,
    this.primaryColor = Colors.blue,
    this.secundaryColor = Colors.grey,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlidershowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            context.read<_SlidershowModel>().primaryColor = this.primaryColor;
            context.read<_SlidershowModel>().primaryColor = this.secundaryColor;
            return _CreateStructureSlideshow(
                pointsAbove: pointsAbove, slides: slides);
          }),
        ),
      ),
    );
  }
}

class _CreateStructureSlideshow extends StatelessWidget {
  const _CreateStructureSlideshow({
    Key key,
    @required this.pointsAbove,
    @required this.slides,
  }) : super(key: key);

  final bool pointsAbove;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.pointsAbove)
          _Dots(
            this.slides.length,
          ),
        Expanded(child: _Slides(this.slides)),
        if (!this.pointsAbove)
          _Dots(
            this.slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(
    this.totalSlides,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  _Dot(
    this.index,
  );
  final int index;

  @override
  Widget build(BuildContext context) {
    final slideshoModel = context.watch<_SlidershowModel>();
    final condition = (slideshoModel.currentPage >= index - 0.5 &&
        slideshoModel.currentPage < index + 0.5);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: condition ? 20 : 14,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: condition ? 20 : 14,
      decoration: BoxDecoration(
        color: condition
            ? slideshoModel.primaryColor
            : slideshoModel.secundaryColor,
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

      context.read<_SlidershowModel>().currentPage = pageViewController.page;
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

class _SlidershowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secundaryColor = Colors.grey;
  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;

    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color color) {
    this._primaryColor = color;
    notifyListeners();
  }

  Color get secundaryColor => this._secundaryColor;
  set secundaryColor(Color color) {
    this._secundaryColor = color;
    notifyListeners();
  }
}
