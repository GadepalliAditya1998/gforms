import 'package:flutter/material.dart';

mixin FormWidgetMixin {
  BorderSide get activeBorderSide =>
      BorderSide(color: Colors.blueAccent, width: 6);

  BorderRadius get roundedCorners => BorderRadius.only(
      topLeft: Radius.circular(12), bottomLeft: Radius.circular(8));
}
