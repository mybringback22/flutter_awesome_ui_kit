import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/awesome_profile_image.dart';

extension DisplayImage on AwesomeProfileImage {
  Widget display(
      {UserStatus? userStatus = UserStatus.offline,
      bool showStatus = false,
      Color? customStatusColor}) {
    return Stack(
      children: [
        Container(
          width: getSizeFromProfileDisplaySize(profileDisplaySize),
          height: getSizeFromProfileDisplaySize(profileDisplaySize),
          decoration: BoxDecoration(
            color: backgoundColor,
            shape: BoxShape.circle,
            border: Border.all(
                color: borderColor,
                width: borderWidth,
                style: BorderStyle.solid),
          ),
          child: (imageUrl != null)
              ? SizedBox(
                  width: getSizeFromProfileDisplaySize(profileDisplaySize),
                  height: getSizeFromProfileDisplaySize(profileDisplaySize),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl!,
                    ),
                  ),
                )
              : SizedBox(
                  width: getSizeFromProfileDisplaySize(profileDisplaySize),
                  height: getSizeFromProfileDisplaySize(profileDisplaySize),
                  child: Container(
                      child: (placeholderAssets != null)
                          ? Image.asset(placeholderAssets!)
                          : Icon(
                              Icons.person,
                              size: getSizeFromProfileDisplaySize(
                                  profileDisplaySize),
                            )),
                ),
        ),
        (showStatus)
            ? Positioned(
                bottom: 0,
                right: getMarginForBadge(profileDisplaySize),
                child: Container(
                  width: getBadgeSizeFromProfileDisplaySize(profileDisplaySize),
                  height:
                      getBadgeSizeFromProfileDisplaySize(profileDisplaySize),
                  decoration: BoxDecoration(
                    color: (customStatusColor != null)
                        ? customStatusColor
                        : getStatusColorBasedOnUserStatus(userStatus!),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : const SizedBox(
                width: 0,
                height: 0,
              )
      ],
    );
  }

  Widget displayWithTextStatus(
      {UserStatus? userStatus = UserStatus.offline,
      bool showStatus = false,
      Color? customStatusColor}) {
    return Stack(
      children: [
        Container(
          width: getSizeFromProfileDisplaySize(profileDisplaySize),
          height: getSizeFromProfileDisplaySize(profileDisplaySize),
          decoration: BoxDecoration(
            color: backgoundColor,
            shape: BoxShape.circle,
            border: Border.all(
                color: borderColor,
                width: borderWidth,
                style: BorderStyle.solid),
          ),
          child: (imageUrl != null)
              ? SizedBox(
                  width: getSizeFromProfileDisplaySize(profileDisplaySize),
                  height: getSizeFromProfileDisplaySize(profileDisplaySize),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl!,
                    ),
                  ),
                )
              : SizedBox(
                  width: getSizeFromProfileDisplaySize(profileDisplaySize),
                  height: getSizeFromProfileDisplaySize(profileDisplaySize),
                  child: Container(
                      child: (placeholderAssets != null)
                          ? Image.asset(placeholderAssets!)
                          : Icon(
                              Icons.person,
                              size: getSizeFromProfileDisplaySize(
                                  profileDisplaySize),
                            )),
                ),
        ),
        (showStatus)
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: (customStatusColor != null)
                          ? customStatusColor
                          : getStatusColorBasedOnUserStatus(userStatus!),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Offline",
                    style: TextStyle(
                      fontSize: getBadgeFontSizeFromProfileDisplaySize(
                        profileDisplaySize,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(
                width: 0,
                height: 0,
              )
      ],
    );
  }

  Widget displayWithIcon(
      {Color badgeBackgroundColor = Colors.grey,
      Color iconColor = Colors.black,
      IconData icon = Icons.upload,
      Color iconBorderColor = Colors.white,
      double iconBorderWidth = 0,
      required Function() onIconClicked}) {
    return Stack(
      children: [
        Container(
          width: getSizeFromProfileDisplaySize(profileDisplaySize),
          height: getSizeFromProfileDisplaySize(profileDisplaySize),
          decoration: BoxDecoration(
            color: backgoundColor,
            shape: BoxShape.circle,
            border: Border.all(
                color: borderColor,
                width: borderWidth,
                style: BorderStyle.solid),
          ),
          child: (imageUrl != null)
              ? SizedBox(
                  width: getSizeFromProfileDisplaySize(profileDisplaySize),
                  height: getSizeFromProfileDisplaySize(profileDisplaySize),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl!,
                    ),
                  ),
                )
              : SizedBox(
                  width: getSizeFromProfileDisplaySize(profileDisplaySize),
                  height: getSizeFromProfileDisplaySize(profileDisplaySize),
                  child: Container(
                      child: (placeholderAssets != null)
                          ? Image.asset(placeholderAssets!)
                          : Icon(
                              Icons.person,
                              size: getSizeFromProfileDisplaySize(
                                  profileDisplaySize),
                            )),
                ),
        ),
        Positioned(
          bottom: 0,
          right: getMarginForBadge(profileDisplaySize),
          child: Container(
            width: getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize),
            height: getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize),
            decoration: BoxDecoration(
              color: badgeBackgroundColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: iconBorderColor,
                width: iconBorderWidth
              )
            ),
            child: Center(
                child: Icon(
              icon,
              size: getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize)-5,
              color: iconColor,
            )),
          ),
        )
      ],
    );
  }
}
