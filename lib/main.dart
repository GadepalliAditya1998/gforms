import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/settings_state.dart';
import 'package:gforms/pages/create_form/create_form.dart';
import 'package:gforms/pages/preview/preview_form.dart';
import 'package:gforms/styles/app_theme.dart';
import 'package:provider/provider.dart';

import 'models/state_models/form_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formStateModel = FormStateModel();
    formStateModel.formThemeConfiguration.backgroundColor = AppTheme.backgroundColors.first.value.toString();
    formStateModel.formThemeConfiguration.themeColor = AppTheme.themeColors.first.value.toString();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormStateModel>(create: (_) => formStateModel),
        ChangeNotifierProvider<SettingsStateModel>(create: (_) => SettingsStateModel(formStateModel)),
      ],
      child: MaterialApp(
        title: 'G Forms',
        theme: AppTheme.loadTheme(),
        initialRoute: 'create',
        routes: {
          'create': (context) => CreateFormScreen(),
          'preview': (context) => FormPreviewScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
