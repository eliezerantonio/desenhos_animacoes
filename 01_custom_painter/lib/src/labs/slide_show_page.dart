// import 'package:custom_painter/src/models/slider_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// class SlideShowPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SliderModel(),
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               Expanded(child: _Slides()),
//               _Dots(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Dots extends StatelessWidget {
//   const _Dots({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 70,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _Dot(0),
//           _Dot(1),
//           _Dot(2),
//         ],
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   _Dot(this.index);
//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     final pageViewIndex = context.watch<SliderModel>().currentPage;
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 200),
//       width: 14,
//       margin: EdgeInsets.symmetric(horizontal: 5),
//       height: 14,
//       decoration: BoxDecoration(
//         color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
//             ? Colors.blue
//             : Colors.grey,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }

// class _Slides extends StatefulWidget {
//   const _Slides({Key key}) : super(key: key);

//   @override
//   State<_Slides> createState() => _SlidesState();
// }

// class _SlidesState extends State<_Slides> {
//   final pageViewController = new PageController();

//   @override
//   void initState() {
//     pageViewController.addListener(() {
//       //update provider

//       context.read<SliderModel>().currentPage = pageViewController.page;
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageViewController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: PageView(
//         controller: pageViewController,
//         physics: BouncingScrollPhysics(),
//         children: [
//           _Slide("assets/slide-1.svg"),
//           _Slide("assets/slide-2.svg"),
//           _Slide("assets/slide-3.svg"),
//         ],
//       ),
//     );
//   }
// }

// class _Slide extends StatelessWidget {
//   final String svg;
//   _Slide(this.svg);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       padding: EdgeInsets.all(30),
//       child: SvgPicture.asset(svg),
//     );
//   }
// }
