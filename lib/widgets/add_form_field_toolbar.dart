import 'package:flutter/material.dart';

class AddFormFieldToolbar extends StatelessWidget {
  const AddFormFieldToolbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.topCenter,
        child: Card(
          elevation: 10,
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
