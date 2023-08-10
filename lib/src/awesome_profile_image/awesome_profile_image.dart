import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/with_icon.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/with_live_effects.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/with_status_dot.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/with_status_text.dart';

abstract class AwesomeProfileImage extends Widget {
  factory AwesomeProfileImage.withStatusDot({
    Key? key,
    ProfileDisplaySize profileDisplaySize = ProfileDisplaySize.medium,
    ProfileDisplayShape profileDisplayShape = ProfileDisplayShape.square,
    Color borderColor = Colors.white,
    Color backgoundColor = Colors.grey,
    String? imageUrl,
    double borderWidth = 0,
    String? placeholderAssets,
    Function()? onImageClicked,
    UserStatus userStatus = UserStatus.offline,
    bool showStatus = false,
    Color? customStatusColor,
  }) {
    return WithStatusDot(
      key: key,
      profileDisplaySize: profileDisplaySize,
      profileDisplayShape: profileDisplayShape,
      borderColor: borderColor,
      backgoundColor: backgoundColor,
      imageUrl: imageUrl,
      borderWidth: borderWidth,
      placeholderAssets: placeholderAssets,
      onImageClicked: onImageClicked,
      userStatus: userStatus,
      showStatus: showStatus,
      customStatusColor: customStatusColor,
    );
  }

  factory AwesomeProfileImage.withIcon({
    Key? key,
    ProfileDisplaySize profileDisplaySize = ProfileDisplaySize.medium,
    ProfileDisplayShape profileDisplayShape = ProfileDisplayShape.square,
    Color borderColor = Colors.white,
    Color backgoundColor = Colors.grey,
    String? imageUrl,
    double borderWidth = 0,
    String? placeholderAssets,
    Function()? onImageClicked,
    Color iconBackgroundColor = Colors.grey,
    Color iconColor = Colors.black,
    IconData icon = Icons.upload,
    Color iconBorderColor = Colors.white,
    double iconBorderWidth = 0,
    required Function() onIconClicked,
  }) {
    return WithIcon(
      key: key,
      profileDisplaySize: profileDisplaySize,
      profileDisplayShape: profileDisplayShape,
      borderColor: borderColor,
      backgoundColor: backgoundColor,
      imageUrl: imageUrl,
      borderWidth: borderWidth,
      placeholderAssets: placeholderAssets,
      onImageClicked: onImageClicked,
      iconBackgroundColor: iconBackgroundColor,
      iconColor: iconColor,
      icon: icon,
      iconBorderColor: iconBorderColor,
      iconBorderWidth: iconBorderWidth,
      onIconClicked: onIconClicked,
    );
  }

  factory AwesomeProfileImage.withStatusText({
    Key? key,
    ProfileDisplaySize profileDisplaySize = ProfileDisplaySize.medium,
    ProfileDisplayShape profileDisplayShape = ProfileDisplayShape.square,
    Color borderColor = Colors.white,
    Color backgoundColor = Colors.grey,
    String? imageUrl,
    double borderWidth = 0,
    String? placeholderAssets,
    Function()? onImageClicked,
    UserStatus userStatus = UserStatus.offline,
    bool showStatus = false,
    Color? customStatusColor,
  }) {
    return WithStatusText(
      key: key,
      profileDisplaySize: profileDisplaySize,
      profileDisplayShape: profileDisplayShape,
      borderColor: borderColor,
      backgoundColor: backgoundColor,
      imageUrl: imageUrl,
      borderWidth: borderWidth,
      placeholderAssets: placeholderAssets,
      onImageClicked: onImageClicked,
      userStatus: userStatus,
      showStatus: showStatus,
      customStatusColor: customStatusColor,
    );
  }

  factory AwesomeProfileImage.withLiveEffects({
    Key? key,
    ProfileDisplaySize profileDisplaySize = ProfileDisplaySize.medium,
    ProfileDisplayShape profileDisplayShape = ProfileDisplayShape.square,
    Color borderColor = Colors.white,
    Color backgoundColor = Colors.grey,
    String? imageUrl,
    double borderWidth = 0,
    String? placeholderAssets,
    Function()? onImageClicked,
    UserStatus? userStatus = UserStatus.offline,
    bool showStatus = false,
    Color badgeColor = Colors.green,
    Color ripplesColor = const Color.fromARGB(255, 129, 199, 132),
    String badgeText = "Live",
  }) {
    return WithLiveEffects(
      key: key,
      profileDisplaySize: profileDisplaySize,
      profileDisplayShape: profileDisplayShape,
      borderColor: borderColor,
      backgoundColor: backgoundColor,
      imageUrl: imageUrl,
      borderWidth: borderWidth,
      placeholderAssets: placeholderAssets,
      onImageClicked: onImageClicked,
      showStatus: showStatus,
      badgeColor: badgeColor,
      ripplesColor: ripplesColor,
      badgeText: badgeText,
    );
  }
}

enum UserStatus {
  online,
  offline,
  away,
  busy,
  dnd,
  inactive,
}

enum ProfileDisplaySize {
  mini,
  small,
  medium,
  large,
}

enum ProfileDisplayShape {
  circle,
  square,
  squareround,
}
