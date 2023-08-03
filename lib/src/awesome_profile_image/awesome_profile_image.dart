import 'package:flutter/material.dart';

class AwesomeProfileImage {
  ProfileDisplaySize profileDisplaySize = ProfileDisplaySize.medium;
  Color borderColor;
  Color? backgoundColor;
  String? imageUrl;
  double borderWidth;
  String? placeholderAssets;
  ProfileDisplayShape? profileDisplayShape = ProfileDisplayShape.circle;
  

  AwesomeProfileImage({
    this.profileDisplaySize = ProfileDisplaySize.medium,
    this.profileDisplayShape = ProfileDisplayShape.square,
    this.borderColor = Colors.white,
    this.backgoundColor = Colors.grey,
    this.imageUrl,
    this.borderWidth = 0,
    this.placeholderAssets,
  });

  
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

 Color getStatusColorBasedOnUserStatus(UserStatus userStatus) {
  switch (userStatus) {
    case UserStatus.online:
      return Colors.green;
    case UserStatus.away:
      return const Color.fromARGB(255, 237, 216, 31);
    case UserStatus.busy:
      return const Color.fromARGB(255, 252, 88, 34);
    case UserStatus.inactive:
      return Colors.grey;
    case UserStatus.offline:
      return const Color.fromARGB(255, 178, 172, 172);
    case UserStatus.dnd:
      return Colors.red;
    default:
      return Colors.green;
  }
}

double getSizeFromProfileDisplaySize(ProfileDisplaySize profileDisplaySize) {
  switch (profileDisplaySize) {
    case ProfileDisplaySize.large:
      return 200;
    case ProfileDisplaySize.small:
      return 50;
    case ProfileDisplaySize.medium:
      return 100;
    case ProfileDisplaySize.mini:
      return 30;
    default:
      return 100;
  }
}

double getMarginForBadge(ProfileDisplaySize profileDisplaySize) {
  switch (profileDisplaySize) {
    case ProfileDisplaySize.large:
      return 25;
    case ProfileDisplaySize.small:
      return 5;
    case ProfileDisplaySize.medium:
      return 10;
    case ProfileDisplaySize.mini:
      return 3;
    default:
      return 10;
  }
}

double getBadgeSizeFromProfileDisplaySize(ProfileDisplaySize profileDisplaySize) {
  switch (profileDisplaySize) {
    case ProfileDisplaySize.large:
      return 30;
    case ProfileDisplaySize.small:
      return 10;
    case ProfileDisplaySize.medium:
      return 20;
    case ProfileDisplaySize.mini:
      return 7;
    default:
      return 20;
  }
}

double getIconBadgeSizeFromProfileDisplaySize(ProfileDisplaySize profileDisplaySize) {
  switch (profileDisplaySize) {
    case ProfileDisplaySize.large:
      return 40;
    case ProfileDisplaySize.small:
      return 20;
    case ProfileDisplaySize.medium:
      return 30;
    case ProfileDisplaySize.mini:
      return 10;
    default:
      return 30;
  }
}


double getBadgeFontSizeFromProfileDisplaySize(ProfileDisplaySize profileDisplaySize) {
  switch (profileDisplaySize) {
    case ProfileDisplaySize.large:
      return 12;
    case ProfileDisplaySize.small:
      return 8;
    case ProfileDisplaySize.medium:
      return 10;
    case ProfileDisplaySize.mini:
      return 6;
    default:
      return 10;
  }
}
