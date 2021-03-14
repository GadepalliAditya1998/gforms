import 'package:flutter/material.dart';

class ColorPaletteMenuItem extends StatelessWidget {
  final bool isSelected;
  final Color color;

  ColorPaletteMenuItem({Key key, this.isSelected, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: color,
        ),
        Visibility(
          visible: isSelected,
          child: Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(color: Theme.of(context).shadowColor, shape: BoxShape.circle),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
