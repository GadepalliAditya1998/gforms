import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.move,
      child: Transform.rotate(
        angle: math.pi / 2,
        child: Icon(
          Icons.drag_indicator_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}
