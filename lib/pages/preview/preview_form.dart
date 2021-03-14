import 'package:flutter/material.dart';

class FormPreviewScreen extends StatelessWidget {
  const FormPreviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Coming soon', style: Theme.of(context).textTheme.headline1),
    );
  }
}
