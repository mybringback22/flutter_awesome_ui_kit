import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_button/awesome_button.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_button/button_utils.dart';

extension ButtonTypes on AwesomeButton {
  Widget rounded() {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: (enabled) ? backgroundColor : disabledBackgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: borderWidth,
          color: (enabled) ? borderColor : disabledBorderColor,
        ),
        boxShadow: [
          (showShadow)
              ? BoxShadow(
                  color: shadowColor!.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5), // changes position of shadow
                )
              : const BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 0, // changes position of shadow
                ),
        ],
      ),
      child: (enabled)
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                highlightColor: (enabled)
                    ? HSLColor.fromColor(backgroundColor)
                        .withLightness(0.9)
                        .toColor()
                    : null,
                splashColor: (enabled)
                    ? HSLColor.fromColor(backgroundColor)
                        .withLightness(0.7)
                        .toColor()
                    : null,
                onTap: onClick,
                child: textChild(),
              ),
            )
          : textChild(),
    );
  }

  Widget roundedCornors() {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          color: (enabled) ? backgroundColor : disabledBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: borderWidth,
            color: (enabled) ? borderColor : disabledBorderColor,
          ),
          boxShadow: [
            (showShadow)
                ? BoxShadow(
                    color: shadowColor!.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 5), // changes position of shadow
                  )
                : const BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 0, // changes position of shadow
                  ),
          ]),
      child: (enabled)
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                highlightColor: (enabled)
                    ? HSLColor.fromColor(backgroundColor)
                        .withLightness(0.9)
                        .toColor()
                    : null,
                splashColor: (enabled)
                    ? HSLColor.fromColor(backgroundColor)
                        .withLightness(0.7)
                        .toColor()
                    : null,
                onTap: onClick,
                child: textChild(),
              ),
            )
          : textChild(),
    );
  }


  Widget flat() {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          color: (enabled) ? backgroundColor : disabledBackgroundColor,
          shape: BoxShape.rectangle,
          border: Border.all(
            width: borderWidth,
            color: (enabled) ? borderColor : disabledBorderColor,
          ),
          boxShadow: [
            (showShadow)
                ? BoxShadow(
                    color: shadowColor!.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 5), // changes position of shadow
                  )
                : const BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 0, // changes position of shadow
                  ),
          ]),
      child: (enabled)
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: (enabled)
                    ? HSLColor.fromColor(backgroundColor)
                        .withLightness(0.9)
                        .toColor()
                    : null,
                splashColor: (enabled)
                    ? HSLColor.fromColor(backgroundColor)
                        .withLightness(0.7)
                        .toColor()
                    : null,
                onTap: onClick,
                child: textChild(),
              ),
            )
          : textChild(),
    );
  }
}
