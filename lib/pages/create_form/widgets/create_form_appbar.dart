import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/settings_state.dart';
import 'package:provider/provider.dart';
import "package:universal_html/html.dart" as html;

class CreateFormAppBar extends PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.insert_drive_file_outlined),
      title: Text('G Forms'),
      actions: [
        IconButton(
            tooltip: 'Theme settings',
            icon: Icon(Icons.color_lens_outlined),
            onPressed: () {
              Provider.of<SettingsStateModel>(context, listen: false).toggleColorPaletteFocus();
            }),
        IconButton(tooltip: 'Preview form', icon: Icon(Icons.remove_red_eye_outlined), onPressed: this._previewForm),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Create'),
            ),
          ),
        )
      ],
    );
  }

  void _previewForm() {
    html.window.open('http://localhost:59369/#preview', '_blank');
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
