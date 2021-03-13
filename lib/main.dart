import 'package:flutter/material.dart';
import 'package:gforms/widgets/form_question.dart';
import 'package:gforms/widgets/form_title.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'GoogleSans',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: 770,
                      child: Column(children: [
                        FormTitle(),
                        FormQuestionField(),
                      ]),
                    ),
                    addToolbar
                  ]))),
    );
  }

  Widget get addToolbar {
    return Container(
        alignment: Alignment.topCenter,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.image_outlined),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
