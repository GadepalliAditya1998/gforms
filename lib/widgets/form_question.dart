import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gforms/widgets/form_widget_mixin.dart';

class FormQuestionField extends StatefulWidget {
  FormQuestionField({Key key}) : super(key: key);

  @override
  _FormQuestionFieldState createState() => _FormQuestionFieldState();
}

class _FormQuestionFieldState extends State<FormQuestionField>
    with FormWidgetMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginTop12,
      decoration: BoxDecoration(
          border: Border(left: activeBorderSide), borderRadius: roundedCorners),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: cardPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.rotate(
                  child: Icon(Icons.drag_indicator_outlined),
                  angle: math.pi / 2),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
