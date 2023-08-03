import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/flutter_awesome_ui_kit.dart';

extension ButtonsUtils on AwesomeButton{
   Widget iconSpacing(bool isAfterText) {
    Widget widget = const SizedBox(
      width: 0,
    );
    if (isIconTrailing && isAfterText) {
      if (imageIcon != null) {
        widget = const SizedBox(width: 10,);
      }
      if (icon != null) {
        widget = const SizedBox(width: 10,);
      }
    }

    if (!isIconTrailing && !isAfterText) {
      if (imageIcon != null) {
        widget = const SizedBox(width: 10,);
      }
      if (icon != null) {
        widget = const SizedBox(width: 10,);
      }
    }

    return widget;
  }

  Widget iconPlacement(bool isAfterText) {
    Widget widget = const SizedBox(
      width: 0,
    );
    if (isIconTrailing && isAfterText) {
      if (imageIcon != null) {
        widget = SizedBox(
          width: iconSize,
          height: iconSize,
          child: Image.asset(
            imageIcon!,
            color: (enabled) ? iconColor : disabledTextColor,
          ),
        );
      }
      if (icon != null) {
        widget = Icon(
          icon,
          size: iconSize,
          color: (enabled) ? iconColor : disabledTextColor,
        );
      }
    } else if (!isIconTrailing && !isAfterText) {
      if (imageIcon != null) {
        widget = SizedBox(
          width: iconSize,
          height: iconSize,
          child: Image.asset(
            imageIcon!,
            color: (enabled) ? iconColor : disabledTextColor,
          ),
        );
      }

      if (icon != null) {
        widget = Icon(
          icon,
          size: iconSize,
          color: (enabled) ? iconColor : disabledTextColor,
        );
      }
    }
    return widget;
  }



  Widget textChild() {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconPlacement(false),
          iconSpacing(false),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: fontWeight,
              color: (enabled) ? textColor : disabledTextColor,
            ),
          ),
          iconPlacement(true),
          iconSpacing(true),
        ],
      ),
    );
  }

  
}