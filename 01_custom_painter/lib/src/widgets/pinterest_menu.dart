import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  PinterestButton({this.onPressed, this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: _PinterestMenuBackground(
          child: _MenuItems(menuItems: items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({Key key, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({Key key, this.menuItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) =>
              _PinterestMenuButton(index: index, item: menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({Key key, this.index, this.item})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final itemSelected = context.watch<_MenuModel>().itemSelected;
    return GestureDetector(
      onTap: () {
        context.read<_MenuModel>().itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon,
            size: (itemSelected == index) ? 35 : 25,
            color: (itemSelected == index) ? Colors.black : Colors.blueGrey),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;

  int get itemSelected => this._itemSelected;

  set itemSelected(int index) {
    this._itemSelected = index;
    notifyListeners();
  }
}
