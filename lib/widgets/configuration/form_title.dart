import 'package:flutter/material.dart';
import 'package:gforms/widgets/shared/base_form_control_card_widget.dart';

class FormTitle extends StatefulWidget {
  final int id;
  FormTitle({Key key, this.id}) : super(key: key);

  @override
  _FormTitleState createState() => _FormTitleState();
}

class _FormTitleState extends State<FormTitle> {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: 'Untitled form');
  }

  @override
  Widget build(BuildContext context) {
    return BaseFormWidget(
      id: widget.id,
      isTopBorderEnabled: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            style: TextStyle(fontSize: 32),
            onTap: () {
              titleController.selection = TextSelection(baseOffset: 0, extentOffset: titleController.text.length);
            },
            controller: titleController,
            decoration: InputDecoration(),
          ),
          TextFormField(style: TextStyle(fontSize: 14), decoration: InputDecoration(hintText: 'Form description'))
        ],
      ),
    );
  }
}
