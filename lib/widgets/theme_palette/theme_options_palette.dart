import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/settings_state.dart';
import 'package:gforms/styles/app_theme.dart';
import 'package:gforms/widgets/theme_palette/color_palette_menu.dart';
import 'package:provider/provider.dart';

class ThemeOptionsPalette extends StatelessWidget {
  const ThemeOptionsPalette({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formSettingsPalette = Provider.of<SettingsStateModel>(context, listen: false);

    return Card(
      child: Container(
          constraints: BoxConstraints(maxWidth: 350),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            AppBar(
              leading: Icon(Icons.color_lens_outlined),
              title: Text('Theme options', style: Theme.of(context).textTheme.headline6),
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    formSettingsPalette.setColorPaletteFocus(false);
                  },
                )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ThemePaletteMenuItem(
                      title: 'Theme color',
                      child: ColorPaletteMenu(
                        colorList: AppTheme.themeColors,
                        selectedColor: formSettingsPalette.formBackgroundColor,
                        onTap: formSettingsPalette.setThemeColor,
                      )),
                  ThemePaletteMenuItem(
                      title: 'Background color',
                      child: ColorPaletteMenu(
                        colorList: AppTheme.backgroundColors,
                        selectedColor: formSettingsPalette.formBackgroundColor,
                        onTap: formSettingsPalette.setFormBackgroundColor,
                      )),
                ],
              ),
            ),
          ])),
    );
  }
}

class ThemePaletteMenuItem extends StatelessWidget {
  final Widget child;
  final String title;

  ThemePaletteMenuItem({Key key, this.title, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 1)),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title.toUpperCase(), style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 10),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
