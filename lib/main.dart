import 'package:flutter/material.dart';
import 'package:gforms/form_builder.dart';
import 'package:gforms/pages/create_form/create_form.dart';
import 'package:gforms/pages/preview/preview_form.dart';
import 'package:gforms/styles/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G Forms',
      theme: AppTheme.loadTheme(),
      routes: {
        'create': (context) => CreateFormScreen(),
        'preview': (context) => FormPreviewScreen(),
      },
      home: FormBuilder(),
      debugShowCheckedModeBanner: false,
    );
  }
}
