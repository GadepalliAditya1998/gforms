import 'package:flutter/material.dart';
import 'package:gforms/widgets/form_widget_mixin.dart';

class FormTitle extends StatefulWidget {
  FormTitle({Key key}) : super(key: key);

  @override
  _FormTitleState createState() => _FormTitleState();
}

class _FormTitleState extends State<FormTitle> with FormWidgetMixin {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: 'Untitled form');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: roundedCorners,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                left: activeBorderSide,
                top: BorderSide(color: Colors.teal, width: 8))),
        child: Card(
          elevation: 4,
          margin: EdgeInsets.zero,
          child: Container(
            padding: cardPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 32),
                  onTap: () {
                    titleController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: titleController.text.length);
                  },
                  controller: titleController,
                  decoration: InputDecoration(),
                ),
                TextFormField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(hintText: 'Form description'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
