import 'package:flutter/material.dart';
import 'package:gforms/widgets/base_form_widget.dart';
import 'package:gforms/widgets/drag_handle.dart';
import 'package:gforms/widgets/form_field_type_dropdown.dart';
import 'package:gforms/widgets/form_widget_mixin.dart';

class FormQuestionField extends StatefulWidget {
  final int id;
  FormQuestionField({Key key, this.id}) : super(key: key);

  @override
  _FormQuestionFieldState createState() => _FormQuestionFieldState();
}

class _FormQuestionFieldState extends State<FormQuestionField> with FormWidgetMixin<FormQuestionField> {
  bool _showDragHandle = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => this._toggleHandleView(true),
      onExit: (_) {
        this._toggleHandleView(false);
      },
      child: BaseFormWidget(
        id: widget.id,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 20,
              child: this._showDragHandle ? DragHandle() : null,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    decoration: InputDecoration(fillColor: Colors.grey[100], filled: true, hintText: 'Question'),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(child: FormFieldTypeDropDown()),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _toggleHandleView(bool canShow) {
    setState(() {
      this._showDragHandle = canShow;
    });
  }
}
