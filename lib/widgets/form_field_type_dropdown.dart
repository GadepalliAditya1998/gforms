import 'package:flutter/material.dart';
import 'package:gforms/models/state_models/enums.dart';

class FormFieldTypeDropDown extends StatelessWidget {
  const FormFieldTypeDropDown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var options = _buildTypeMenu();
    return DropdownButtonFormField(
      onChanged: (item) {},
      decoration: InputDecoration(border: OutlineInputBorder(), isDense: true),
      items: options,
      value: options.first.value,
    );
  }

  List<DropdownMenuItem> _buildTypeMenu() {
    var list = [
      _getWidget(Icons.radio_button_checked_outlined, 'Multiple choices', FormFieldType.radios),
      _getWidget(Icons.arrow_drop_down_circle_outlined, 'Dropdown', FormFieldType.dropdown),
    ];
    return list;
  }

  DropdownMenuItem _getWidget(IconData icon, String label, FormFieldType fieldType) {
    return DropdownMenuItem(
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
