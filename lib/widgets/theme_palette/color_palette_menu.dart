import 'package:flutter/material.dart';
import 'package:gforms/widgets/theme_palette/color_palette_menu_item.dart';

class ColorPaletteMenu extends StatelessWidget {
  final List<Color> colorList;
  final Function(Color color) onTap;
  final Color selectedColor;
  const ColorPaletteMenu({Key key, this.colorList, this.onTap, this.selectedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      runSpacing: 8,
      children: this
          .colorList
          .map((e) => InkWell(
                onTap: () {
                  this?.onTap(e);
                },
                child: ColorPaletteMenuItem(isSelected: this.selectedColor == e, color: e),
              ))
          .toList(),
    );
  }
}
