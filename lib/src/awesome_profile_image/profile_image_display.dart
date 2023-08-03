import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/awesome_profile_image.dart';

extension DisplayImage on AwesomeProfileImage {
  Widget display(
      {UserStatus? userStatus = UserStatus.offline,
      bool showStatus = false,
      Color? customStatusColor}) {
    return Stack(
      children: [
        mainDisplay(),
        (showStatus)
            ? Positioned(
                bottom: 0,
                right: (profileDisplayShape == ProfileDisplayShape.circle)? getMarginForBadge(profileDisplaySize): 0,
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
        mainDisplay(),
        (showStatus)
            ? Positioned(
                bottom: 0,
                right: (profileDisplaySize == ProfileDisplaySize.large && profileDisplayShape== ProfileDisplayShape.circle)? 30 :0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: (customStatusColor != null)
                          ? customStatusColor
                          : getStatusColorBasedOnUserStatus(userStatus!),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    userStatus!.name.toUpperCase(),
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
        mainDisplay(),
        Positioned(
          bottom: 0,
          right: getMarginForBadge(profileDisplaySize),
          child: Container(
            width: getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize),
            height: getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize),
            decoration: BoxDecoration(
                color: badgeBackgroundColor,
                shape: BoxShape.circle,
                border:
                    Border.all(color: iconBorderColor, width: iconBorderWidth)),
            child: Center(
                child: Icon(
              icon,
              size: getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize) -
                  5,
              color: iconColor,
            )),
          ),
        )
      ],
    );
  }

  Widget mainDisplay() {
    return Container(
      width: getSizeFromProfileDisplaySize(profileDisplaySize),
      height: getSizeFromProfileDisplaySize(profileDisplaySize),
      decoration: BoxDecoration(
        color: backgoundColor,
        shape: (profileDisplayShape == ProfileDisplayShape.circle)
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: (profileDisplayShape == ProfileDisplayShape.squareround)
            ? BorderRadius.circular(10)
            : null,
        border: Border.all(
            color: borderColor, width: borderWidth, style: BorderStyle.solid),
      ),
      child: (imageUrl != null)
          ? SizedBox(
              width: getSizeFromProfileDisplaySize(profileDisplaySize),
              height: getSizeFromProfileDisplaySize(profileDisplaySize),
              child: (profileDisplayShape == ProfileDisplayShape.circle)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl!,
                      ),
                    )
                  : SizedBox(
                      width: getSizeFromProfileDisplaySize(profileDisplaySize),
                      height: getSizeFromProfileDisplaySize(profileDisplaySize),
                      child: (profileDisplayShape ==
                              ProfileDisplayShape.squareround)
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrl!,
                              ),
                            )
                          : Image.network(
                              imageUrl!,
                            ),
                    ),
            )
          : SizedBox(
              width: getSizeFromProfileDisplaySize(profileDisplaySize),
              height: getSizeFromProfileDisplaySize(profileDisplaySize),
              child: Container(
                  child: (placeholderAssets != null)
                      ? getPlaceholder()
                      : Icon(
                          Icons.person,
                          size:
                              getSizeFromProfileDisplaySize(profileDisplaySize),
                        )),
            ),
    );
  }

  Widget getPlaceholder() {
    return (profileDisplayShape == ProfileDisplayShape.circle)
        ? CircleAvatar(
            backgroundImage: Image.asset(placeholderAssets!).image,
          )
        : SizedBox(
            width: getSizeFromProfileDisplaySize(profileDisplaySize),
            height: getSizeFromProfileDisplaySize(profileDisplaySize),
            child: (profileDisplayShape == ProfileDisplayShape.squareround)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(placeholderAssets!),
                  )
                : Image.asset(placeholderAssets!),
          );
  }
}
