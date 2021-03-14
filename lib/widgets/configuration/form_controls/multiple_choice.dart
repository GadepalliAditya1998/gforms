import 'package:flutter/material.dart';

import 'package:gforms/extensions/theme_extensions.dart';
import 'package:gforms/models/config/multi_options.dart';

class MultipleChoiceFormControl extends StatefulWidget {
  final List<MultiOptions> options;
  final String groupName;
  final Function(MultiOptions) onAddOption;
  final Function(int) onRemoveOption;
  final Function(int, String) onTitleUpdated;
  MultipleChoiceFormControl({Key key, this.groupName, this.onAddOption, this.onTitleUpdated, this.onRemoveOption, this.options}) : super(key: key);

  @override
  _MultipleChoiceFormControlState createState() => _MultipleChoiceFormControlState();
}

class _MultipleChoiceFormControlState extends State<MultipleChoiceFormControl> {
  // var options = <MultiOptions>[];
  var textControllers = Map<int, TextEditingController>();

  @override
  void initState() {
    super.initState();
    // this.options = widget.options ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: this._optionsList,
      ),
    );
  }

  List<Widget> get _optionsList {
    var options = widget.options.map((option) => this._getOptionTile(option)).toList();
    options.add(this._addOtherOptionWidget);
    return options;
  }

  Widget _getOptionTile(MultiOptions option) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Radio(
                  value: option.value,
                  groupValue: widget.groupName,
                  onChanged: (value) {
                    widget.options.forEach((option) => option.isSelected = false);
                    setState(() {
                      widget.options.firstWhere((opt) => option.id == opt.id, orElse: () => null)?.isSelected = true;
                    });
                  },
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Option', contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 8), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor))),
                    style: Theme.of(context).textTheme.subtitle2,
                    onChanged: (String value) {
                      if (widget.onTitleUpdated != null) {
                        // widget.onTitleUpdated(option.id, value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.close), onPressed: () => this._removeOption(option.id)),
        ],
      ),
    );
  }

  void _addOption() {
    int id = this._getId;
    var newOption = MultiOptions(id: id, value: '$id');
    this.textControllers.putIfAbsent(id, () => TextEditingController());
    setState(() => widget.options.add(newOption));
    // if (widget.onAddOption != null) widget.onAddOption(newOption);
  }

  void _removeOption(int id) {
    setState(() => widget.options.removeWhere((option) => option.id == id));
    if (widget.onRemoveOption != null) {
      // widget.onRemoveOption(id);
    }
  }

  Widget get _addOtherOptionWidget {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Row(
            children: [
              Radio(value: false, groupValue: null, onChanged: null),
              Text('Add Option', style: Theme.of(context).textTheme.caption),
              SizedBox(width: 3),
              Text('or', style: Theme.of(context).textTheme.subtitle2),
              SizedBox(width: 3),
              InkWell(
                  onTap: this._addOption,
                  child: Text(
                    'Add "Other"',
                    style: Theme.of(context).textTheme.hyperLink,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  int get _getId {
    return widget.options.isNotEmpty ? widget.options.last.id + 1 : 0;
  }
}
