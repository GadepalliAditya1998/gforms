import 'package:flutter/material.dart';
import 'package:gforms/models/config/field_configuration.dart';
import 'package:gforms/models/state_models/form_state.dart';
import 'package:provider/provider.dart';

class AddFormFieldToolbar extends StatelessWidget {
  const AddFormFieldToolbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formStateModel = Provider.of<FormStateModel>(context, listen: false);
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.topCenter,
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  formStateModel.addFormControl(FormFieldConfiguration());
                },
              ),
              IconButton(
                icon: Icon(Icons.image_outlined),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
