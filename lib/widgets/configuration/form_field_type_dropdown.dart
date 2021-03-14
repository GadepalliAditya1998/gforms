import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/enums.dart';

class FormFieldTypeDropDown extends StatelessWidget {
  final FormFieldType selectedValue;
  final void Function(FormFieldType) onChange;
  const FormFieldTypeDropDown({Key key, this.onChange, this.selectedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var options = _buildTypeMenu();
    return DropdownButtonFormField<FormFieldType>(
      onChanged: onChange,
      decoration: InputDecoration(border: OutlineInputBorder(), isDense: true, hintText: 'Select an option'),
      items: options,
      value: selectedValue,
    );
  }

  List<DropdownMenuItem<FormFieldType>> _buildTypeMenu() {
    var list = [
      _getWidget(Icons.radio_button_checked_outlined, 'Multiple choices', FormFieldType.radios),
      _getWidget(Icons.check_box, 'Checkboxes', FormFieldType.checkboxes),
      _getWidget(Icons.arrow_drop_down_circle_outlined, 'Dropdown', FormFieldType.dropdown),
      _getWidget(Icons.short_text_outlined, 'Short Paragraph', FormFieldType.shortAnswer),
      _getWidget(Icons.reorder_outlined, 'Long Paragraph', FormFieldType.paragraph),
    ];
    return list;
  }

  DropdownMenuItem<FormFieldType> _getWidget(IconData icon, String label, FormFieldType fieldType) {
    return DropdownMenuItem<FormFieldType>(
      value: fieldType,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Icon(icon)),
          SizedBox(width: 8),
          Flexible(
              child: Text(
            label,
          )),
        ],
      ),
    );
  }
}
