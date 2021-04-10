import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/form_state.dart';
import 'package:gforms/widgets/shared/base_form_control_card_widget.dart';
import 'package:gforms/widgets/shared/validators/validators.dart';
import 'package:provider/provider.dart';

class FormTitle extends StatefulWidget {
  FormTitle({Key key}) : super(key: key);

  @override
  _FormTitleState createState() => _FormTitleState();
}

class _FormTitleState extends State<FormTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formConfig = Provider.of<FormStateModel>(context, listen: false).formConfiguration;
    return BaseFormWidget(
      id: formConfig.id,
      isTopBorderEnabled: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: formConfig.name,
            style: TextStyle(fontSize: 32),
            decoration: InputDecoration(),
            validator: (value) => validateIfEmpty(value, message: 'Title is required'),
            autovalidateMode: AutovalidateMode.always,
            onSaved: (title) {
              formConfig.name = title;
            },
          ),
          TextFormField(
            initialValue: formConfig.description,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(hintText: 'Form description'),
            onSaved: (description) {
              formConfig.description = description;
            },
          )
        ],
      ),
    );
  }
}
