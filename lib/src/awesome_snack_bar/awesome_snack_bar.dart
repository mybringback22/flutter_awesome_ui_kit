import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/flutter_awesome_ui_kit.dart';

class AwesomeSnackbar {
  BuildContext context;
  String text;
  EdgeInsets padding;
  double iconSize;
  double textSize;
  FontWeight fontWeight;
  BorderShape borderShape;
  TextBoxType textBoxType;
  int maxLines;
  IconData? customIcon;
  Color? customTextColor;
  Color? custombackgroundColor;
  int duration;

  AwesomeSnackbar(
    this.text, {
    required this.context,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.textSize = 16,
    this.fontWeight = FontWeight.normal,
    this.iconSize = 20,
    this.borderShape = BorderShape.flat,
    this.textBoxType = TextBoxType.info,
    this.maxLines = 1,
    this.customIcon,
    this.customTextColor,
    this.custombackgroundColor,
    this.duration = 1500
  });

  void show() {
    SnackBar bar = SnackBar(
      behavior: SnackBarBehavior.fixed ,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(milliseconds: duration),
      content: AwesomeTextBoxed(
        text,
        width: double.infinity,
        padding: padding,
        custombackgroundColor: custombackgroundColor,
        textSize: textSize,
        fontWeight: fontWeight,
        borderShape: borderShape,
        maxLines: maxLines,
        customIcon: customIcon,
        textBoxType:textBoxType,
        customTextColor: customTextColor,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(bar);
  }
}
