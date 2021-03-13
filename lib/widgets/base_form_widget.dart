import 'package:flutter/material.dart';
import 'package:gforms/extensions/color_extensions.dart';
import 'package:gforms/models/state_models/form_state.dart';
import 'package:provider/provider.dart';

class BaseFormWidget extends StatelessWidget {
  final Widget child;
  final int id;
  final isTopBorderEnabled;

  const BaseFormWidget({Key key, this.child, this.id, this.isTopBorderEnabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: getBoxShadow(context)),
      margin: this.defaultMargin,
      child: ClipRRect(
          borderRadius: roundedCorners,
          child: Consumer<FormStateModel>(
            child: child,
            builder: (context, formStateModel, child) {
              print(formStateModel.formThemeConfiguration.themeColor);
              return GestureDetector(
                onTap: () => formStateModel.setActiveFormElement(id),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: formStateModel.isActiveFormElement(id) ? activeBorderSide : inActiveBorderSide,
                        top: this.isTopBorderEnabled ? BorderSide(color: ColorExtensions.fromString(formStateModel.formThemeConfiguration.themeColor), width: 8) : inActiveBorderSide,
                      ),
                    ),
                    child: Card(
                        margin: EdgeInsets.zero,
                        child: Container(
                          width: double.infinity,
                          padding: cardPadding,
                          child: child,
                        ))),
              );
            },
          )),
    );
  }

  BorderRadius get roundedCorners => BorderRadius.circular(12);

  EdgeInsetsGeometry get defaultMargin => EdgeInsets.symmetric(vertical: 6);

  EdgeInsetsGeometry get cardPadding => EdgeInsets.symmetric(horizontal: 24, vertical: 22);

  BorderSide get activeBorderSide => BorderSide(color: Colors.blueAccent, width: 6);

  BorderSide get inActiveBorderSide => BorderSide.none;

  List<BoxShadow> getBoxShadow(BuildContext context) => [
        BoxShadow(color: Theme.of(context).shadowColor, spreadRadius: 0, blurRadius: 5, offset: Offset(0, 2)),
      ];
}
