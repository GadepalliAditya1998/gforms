import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/settings_state.dart';
import 'package:gforms/styles/app_theme.dart';
import 'package:gforms/widgets/add_form_field_toolbar.dart';
import 'package:gforms/widgets/form_question.dart';
import 'package:gforms/widgets/form_title.dart';
import 'package:provider/provider.dart';

import 'models/state_models/form_state.dart';
import 'widgets/theme_palette/theme_options_palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formStateModel = FormStateModel();
    formStateModel.formThemeConfiguration.backgroundColor = AppTheme.backgroundColors.first.value.toString();
    formStateModel.formThemeConfiguration.themeColor = AppTheme.themeColors.first.value.toString();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.loadTheme(),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<FormStateModel>(create: (_) => formStateModel),
        ChangeNotifierProvider<SettingsStateModel>(create: (_) => SettingsStateModel(formStateModel)),
      ], child: MyHomePage(title: 'Flutter Demo Home Page')),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Selector<SettingsStateModel, Color>(
      selector: (context, settingsStateModel) => settingsStateModel.formBackgroundColor,
      child: _child,
      builder: (context, backgroundColor, child) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.color_lens_outlined),
                onPressed: () {
                  Provider.of<SettingsStateModel>(context, listen: false).toggleColorPaletteFocus();
                })
          ],
        ),
        body: Stack(children: [
          child,
          Consumer<SettingsStateModel>(
              builder: (context, settingsModel, _) => AnimatedPositioned(
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 500),
                    right: settingsModel.isColorPaletteInFocus ? 0 : -400,
                    child: ThemeOptionsPalette(),
                  )),
        ]),
      ),
    );
  }

  Widget get _child => SingleChildScrollView(
      child: Align(
          alignment: Alignment.topCenter,
          child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.topCenter,
              width: 770,
              child: Column(children: [
                FormTitle(id: 1),
                FormQuestionField(id: 2),
              ]),
            ),
            AddFormFieldToolbar(),
          ])));
}
