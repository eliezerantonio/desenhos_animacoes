import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  PinterestButton({this.onPressed, this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestButton> items;

  PinterestMenu(
      {Key key,
      this.show = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      @required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        opacity: show ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: Builder(builder: (context) {
          context.read<_MenuModel>().backgroundColor = backgroundColor;
          context.read<_MenuModel>().activeColor = activeColor;
          context.read<_MenuModel>().inactiveColor = inactiveColor;
          return _PinterestMenuBackground(
            child: _MenuItems(menuItems: items),
          );
        }),
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
    final backgroundColor = context.read<_MenuModel>().backgroundColor;
    return Container(
      width: 250,
      height: 60,
      child: child,
      decoration: BoxDecoration(
        color: backgroundColor,
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
    final activeColor = context.read<_MenuModel>().activeColor;
    final inactiveColor = context.read<_MenuModel>().inactiveColor;

    return GestureDetector(
      onTap: () {
        context.read<_MenuModel>().itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon,
            size: (itemSelected == index) ? 35 : 25,
            color: (itemSelected == index) ? activeColor : inactiveColor),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;

  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSelected => this._itemSelected;

  set itemSelected(int index) {
    this._itemSelected = index;
    notifyListeners();
  }
}
