import 'package:flutter/material.dart';

mixin FormWidgetMixin {
  BorderSide get activeBorderSide =>
      BorderSide(color: Colors.blueAccent, width: 6);

  BorderRadius get roundedCorners => BorderRadius.circular(12);

  EdgeInsetsGeometry get marginTop12 => EdgeInsets.only(top: 12);

  EdgeInsetsGeometry get cardPadding =>
      EdgeInsets.symmetric(horizontal: 24, vertical: 22);
}
