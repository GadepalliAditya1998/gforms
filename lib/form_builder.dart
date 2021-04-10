import 'package:flutter/material.dart';
import 'package:gforms/pages/create_form/create_form.dart';
import 'package:gforms/pages/preview/preview_form.dart';
import 'package:provider/provider.dart';

import 'models/state_models/form_state.dart';
import 'models/state_models/settings_state.dart';

class FormBuilder extends StatelessWidget {
  const FormBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formStateModel = FormStateModel.initNewForm();
    if (formStateModel.isConfigMode)
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<FormStateModel>(create: (_) => formStateModel),
          ChangeNotifierProvider<SettingsStateModel>(create: (_) => SettingsStateModel(formStateModel)),
        ],
        child: CreateFormScreen(),
      );
    else
      return FormPreviewScreen();
  }
}
