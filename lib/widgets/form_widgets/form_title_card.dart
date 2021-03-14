import 'package:flutter/material.dart';
import 'package:gforms/widgets/shared/base_form_control_card_widget.dart';

class FormTitleCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;

  const FormTitleCard({Key key, this.id, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseFormWidget(
      id: id,
      isTopBorderEnabled: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline1),
          SizedBox(height: 10),
          Text(description, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}
