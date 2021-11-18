import 'package:custom_painter/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
    
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ]
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    final show = context.watch<_MenuModel>().show;
    return Positioned(
      bottom: 20,
      child: Container(
        width: size,
        alignment: Alignment.center,
        child: PinterestMenu(
          show: show,
          backgroundColor: Colors.white,
          activeColor: Colors.red,
          inactiveColor: Colors.blueGrey,
          items: [
            PinterestButton(
                icon: Icons.pie_chart,
                onPressed: () {
                  print('Icon  Grafico');
                }),
            PinterestButton(
                icon: Icons.search,
                onPressed: () {
                  print('Icon  Pesquisar');
                }),
            PinterestButton(
                icon: Icons.notifications,
                onPressed: () {
                  print('Icon  Notificacoes');
                }),
            PinterestButton(
                icon: Icons.supervised_user_circle,
                onPressed: () {
                  print('Icon  Usuario ');
                }),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double previousScroll = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > previousScroll && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      previousScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;
  bool get show => _show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
