import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/form_state.dart';
import 'package:gforms/models/state_models/settings_state.dart';
import 'package:gforms/pages/create_form/widgets/create_form_appbar.dart';
import 'package:gforms/widgets/configuration/add_form_field_toolbar.dart';
import 'package:gforms/widgets/configuration/form_question.dart';
import 'package:gforms/widgets/configuration/form_title.dart';
import 'package:gforms/widgets/shared/theme_palette/theme_options_palette.dart';
import 'package:provider/provider.dart';

class CreateFormScreen extends StatefulWidget {
  CreateFormScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateFormScreenState createState() => _CreateFormScreenState();
}

class _CreateFormScreenState extends State<CreateFormScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Selector<SettingsStateModel, Color>(
      selector: (context, settingsStateModel) => settingsStateModel.formBackgroundColor,
      child: _child,
      builder: (context, backgroundColor, child) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: CreateFormAppBar(),
        body: Stack(fit: StackFit.expand, children: [
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

  Widget get _child => Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Align(
              alignment: Alignment.topCenter,
              child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 770,
                  child: Consumer<FormStateModel>(
                    child: FormTitle(id: 1),
                    builder: (context, formStateModel, child) => Column(mainAxisSize: MainAxisSize.min, children: [child]..addAll(_fields)),
                  ),
                ),
                AddFormFieldToolbar(),
              ])),
        ),
      );

  List<Widget> get _fields {
    var formStateModel = Provider.of<FormStateModel>(context, listen: false);
    return formStateModel.formFieldConfiguration.map((e) => FormQuestionField(id: e.id, key: UniqueKey())).toList();
  }
}
