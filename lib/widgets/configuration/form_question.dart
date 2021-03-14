import 'package:flutter/material.dart';
import 'package:gforms/models/config/field_configuration.dart';
import 'package:gforms/models/state_models/enums.dart';
import 'package:gforms/models/state_models/form_state.dart';
import 'package:gforms/widgets/shared/base_form_control_card_widget.dart';
import 'package:gforms/widgets/shared/drag_handle.dart';
import 'package:gforms/widgets/configuration/form_field_type_dropdown.dart';
import 'package:provider/provider.dart';

import 'form_controls/multiple_checkbox_choice.dart';
import 'form_controls/multiple_choice.dart';

class FormQuestionField extends StatefulWidget {
  final int id;
  final bool isConfig;
  FormQuestionField({Key key, this.id, this.isConfig = true}) : super(key: key);

  @override
  _FormQuestionFieldState createState() => _FormQuestionFieldState();
}

class _FormQuestionFieldState extends State<FormQuestionField> {
  bool _showDragHandle = false;
  @override
  Widget build(BuildContext context) {
    var formStateModel = Provider.of<FormStateModel>(context, listen: false);
    var config = formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id);
    return BaseFormWidget(
      id: widget.id,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MouseRegion(
              onHover: (_) => this._toggleHandleView(true),
              onExit: (_) {
                this._toggleHandleView(false);
              },
              child: Container(
                alignment: Alignment.topCenter,
                height: 20,
                child: this._showDragHandle ? DragHandle() : null,
              )),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: TextFormField(
                    decoration: InputDecoration(fillColor: Colors.grey[100], filled: true, hintText: 'Question'),
                    style: TextStyle(fontSize: 14),
                    initialValue: config.fieldName,
                    onChanged: (val) => formStateModel.setQuestionTitle(widget.id, val),
                  )),
              SizedBox(width: 10),
              Visibility(
                visible: widget.isConfig,
                child: Flexible(
                    child: FormFieldTypeDropDown(
                  selectedValue: config.fieldType,
                  onChange: (selectedFieldType) {
                    setState(() => config.fieldType = selectedFieldType);
                  },
                )),
              ),
            ],
          ),
          // Body
          Container(margin: EdgeInsets.symmetric(vertical: 8), child: this.loadWidget(config)),
          //Footer
          Visibility(
            visible: widget.isConfig,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.copy_outlined),
                    onPressed: () {
                      formStateModel.cloneFormControl(widget.id);
                    }),
                SizedBox(width: 10),
                IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      formStateModel.deleteFormControl(widget.id);
                    }),
                Container(height: 32, width: 0.8, color: Theme.of(context).dividerColor, margin: EdgeInsets.only(right: 10)),
                Text('Required', style: Theme.of(context).textTheme.subtitle1),
                Switch(
                  value: formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id)?.isRequired ?? false,
                  onChanged: (active) => formStateModel.setFormControlRequired(widget.id, active),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loadWidget(FormFieldConfiguration formFieldConfiguration) {
    switch (formFieldConfiguration.fieldType) {
      case FormFieldType.shortAnswer:
        return TextFormField(maxLines: 2, decoration: InputDecoration(hintText: 'Enter answer', focusedBorder: UnderlineInputBorder(borderSide: focusedBorder)), readOnly: true);
      case FormFieldType.paragraph:
        return TextFormField(maxLines: null, minLines: 5, decoration: InputDecoration(hintText: 'Enter answer', focusedBorder: UnderlineInputBorder(borderSide: focusedBorder)));
      case FormFieldType.checkboxes:
        var formStateModel = Provider.of<FormStateModel>(context, listen: false);
        return MultipleCheckboxChoiceFormControl(
          isConfigMode: false,
          options: formFieldConfiguration.options,
          onAddOption: (option) {
            var element = formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id, orElse: () => null);
            if (element != null) {
              element.options.add(option);
            }
          },
          onTitleUpdated: (id, title) {
            var element = formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id, orElse: () => null);
            if (element != null) {
              element.options.firstWhere((opt) => opt.id == id, orElse: () => null)?.name = title;
            }
          },
          onRemoveOption: (id) {
            var element = formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id, orElse: () => null);
            if (element != null) {
              element.options.removeWhere((opt) => opt.id == id);
            }
          },
        );
        break;
      case FormFieldType.dropdown:
        break;
      case FormFieldType.radios:
        var formStateModel = Provider.of<FormStateModel>(context, listen: false);
        return MultipleChoiceFormControl(
          options: formFieldConfiguration.options,
          onAddOption: (option) {
            var element = formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id, orElse: () => null);
            if (element != null) {
              element.options.add(option);
            }
          },
          onTitleUpdated: (id, title) {
            var element = formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id, orElse: () => null);
            if (element != null) {
              element.options.firstWhere((opt) => opt.id == id, orElse: () => null)?.name = title;
            }
          },
          onRemoveOption: (id) {
            var element = formStateModel.formFieldConfiguration.firstWhere((element) => element.id == widget.id, orElse: () => null);
            if (element != null) {
              element.options.removeWhere((opt) => opt.id == id);
            }
          },
        );
      case FormFieldType.date:
        break;
      case FormFieldType.time:
        break;
    }
    return SizedBox();
  }

  void _toggleHandleView(bool canShow) {
    setState(() {
      this._showDragHandle = canShow;
    });
  }

  BorderSide get focusedBorder => BorderSide(color: Theme.of(context).dividerColor);
}
