import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/flutter_awesome_ui_kit.dart';

//ignore: must_be_immutable
class AwesomeTextBoxed extends StatelessWidget {
  String text;
  EdgeInsets margin;
  EdgeInsets padding;
  double iconSize;
  double textSize;
  FontWeight fontWeight;
  double width;
  BorderShape borderShape;
  TextBoxType textBoxType;
  int maxLines;
  IconData? customIcon;
  Color? customTextColor;
  Color? custombackgroundColor;

  AwesomeTextBoxed(
    this.text, {
    super.key,
    this.margin = const EdgeInsets.all(5),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.width = double.infinity,
    this.textSize = 16,
    this.fontWeight = FontWeight.normal,
    this.iconSize = 20,
    this.borderShape = BorderShape.flat,
    this.textBoxType = TextBoxType.info,
    this.maxLines = 1,
    this.customIcon,
    this.customTextColor,
    this.custombackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (textBoxType == TextBoxType.custom &&
        (customIcon == null ||
            customTextColor == null ||
            custombackgroundColor == null)) {
              throw Exception(
          'Add all Customs values to use TextBoxType.custom for AwesomeTextBoxed');
            }
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: _getBackgroundColor(),
          border: Border.all(
            color: _getTextColor(),
          ),
          borderRadius: BorderRadius.circular(_getBorderShape())),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Icon(
            _getIcon(),
            color: _getTextColor(),
          ),
        ),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            style: TextStyle(
              color: _getTextColor(),
              fontSize: textSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ]),
    );
  }

  Color _getBackgroundColor() {
    switch (textBoxType) {
      case TextBoxType.error:
        return Colors.red.shade100;
      case TextBoxType.info:
        return Colors.blue.shade100;
      case TextBoxType.success:
        return Colors.green.shade100;
      case TextBoxType.warning:
        return const Color.fromARGB(255, 255, 248, 220);
      case TextBoxType.custom:
        return custombackgroundColor!;
    }
  }

  Color _getTextColor() {
    switch (textBoxType) {
      case TextBoxType.error:
        return Colors.red;
      case TextBoxType.info:
        return Colors.blue;
      case TextBoxType.success:
        return Colors.green;
      case TextBoxType.warning:
        return const Color.fromARGB(255, 239, 203, 0);
      case TextBoxType.custom:
        return customTextColor!;
    }
  }

  IconData _getIcon() {
    switch (textBoxType) {
      case TextBoxType.error:
        return Icons.error_outline;
      case TextBoxType.info:
        return Icons.info_outline;
      case TextBoxType.success:
        return Icons.check_outlined;
      case TextBoxType.warning:
        return Icons.warning_outlined;
      case TextBoxType.custom:
        return customIcon!;
    }
  }

  double _getBorderShape() {
    switch (borderShape) {
      case BorderShape.circle:
        return 100;
      case BorderShape.rounded:
        return 10;
      case BorderShape.flat:
        return 0;
    }
  }
}
