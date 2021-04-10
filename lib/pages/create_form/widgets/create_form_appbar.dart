import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/form_state.dart';
import 'package:gforms/models/state_models/settings_state.dart';
import 'package:provider/provider.dart';
import "package:universal_html/html.dart" as html;

class CreateFormAppBar extends PreferredSize {
  final VoidCallback onTapCreate;

  CreateFormAppBar({this.onTapCreate});

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
        IconButton(tooltip: 'Preview form', icon: Icon(Icons.remove_red_eye_outlined), onPressed: () => this._previewForm(context)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => this._createForm(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Create'),
            ),
          ),
        )
      ],
    );
  }

  void _createForm(BuildContext context) {
    var formModel = Provider.of<FormStateModel>(context, listen: false).saveFormConfiguration();
    print(jsonEncode(formModel.toJson()));
  }

  void _previewForm(BuildContext context) {
    var formModel = Provider.of<FormStateModel>(context, listen: false).saveFormConfiguration();
    print(jsonEncode(formModel.toJson()));
    var baseUrl = html.window.location.origin;
    html.window.open('$baseUrl/#preview', '_blank');
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
