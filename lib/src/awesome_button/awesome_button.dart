import 'package:flutter/material.dart';

class AwesomeButton {
  String text;
  EdgeInsets? padding;
  EdgeInsets? margin;
  Color backgroundColor;
  double borderWidth;
  Color borderColor;
  double textSize;
  Color textColor;
  Color disabledTextColor;
  Color disabledBackgroundColor;
  Color disabledBorderColor;
  bool enabled;
  double width;
  Function() onClick;
  IconData? icon;
  String? imageIcon;
  double? iconSize;
  Color? iconColor;
  bool showShadow;
  Color? shadowColor;
  FontWeight fontWeight;
  bool isIconTrailing;


  AwesomeButton(
    this.text, {
    this.width = double.infinity,
    this.backgroundColor = Colors.red,
    this.shadowColor =  const Color.fromARGB(255, 117, 117, 117),
    this.textSize = 16,
    this.enabled = true,
    this.showShadow = false,
    this.isIconTrailing = false,
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    this.iconSize = 20,
    this.iconColor,
    this.icon,
    this.imageIcon,
    this.borderWidth = 0,
    this.borderColor = Colors.white,
    this.textColor = Colors.black,
    this.disabledBorderColor = Colors.grey,
    this.disabledTextColor = Colors.grey,
    this.disabledBackgroundColor = const Color.fromARGB(255, 158, 158, 158),
    this.margin = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 30,
    ),
    required this.onClick,
  }) {
    if (icon != null && imageIcon != null) {
      throw Exception('There can only one of icon or imageIcon');
    }
    if(!enabled){
      showShadow = false;
    }
  }
}
