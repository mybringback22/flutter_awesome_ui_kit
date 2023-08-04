import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/awesome_profile_image.dart';

extension DisplayImage on AwesomeProfileImage {
  Widget display(
      {UserStatus? userStatus = UserStatus.offline,
      bool showStatus = false,
      Color? customStatusColor}) {
    return GestureDetector(
      onTap: () {
        if (onImageClicked != null) {
          onImageClicked!();
        }
      },
      child: Stack(
        children: [
          mainDisplay(),
          (showStatus)
              ? Positioned(
                  bottom: 0,
                  right: (profileDisplayShape == ProfileDisplayShape.circle)
                      ? getMarginForBadge(profileDisplaySize)
                      : 0,
                  child: Container(
                    width:
                        getBadgeSizeFromProfileDisplaySize(profileDisplaySize),
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
      ),
    );
  }

  Widget displayWithTextStatus(
      {UserStatus? userStatus = UserStatus.offline,
      bool showStatus = false,
      Color? customStatusColor}) {
    return GestureDetector(
      onTap: () {
        if (onImageClicked != null) {
          onImageClicked!();
        }
      },
      child: Stack(
        children: [
          mainDisplay(),
          (showStatus)
              ? Positioned(
                  bottom: 0,
                  right: (profileDisplaySize == ProfileDisplaySize.large &&
                          profileDisplayShape == ProfileDisplayShape.circle)
                      ? 30
                      : 0,
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
      ),
    );
  }

  Widget displayLive({
    UserStatus? userStatus = UserStatus.offline,
    bool showStatus = false,
    Color badgeColor = Colors.green,
    Color ripplesColor = const Color.fromARGB(255, 129, 199, 132),
    TickerProvider? tickerProvider,
    String badgeText = "Live", 
  }) {
    if (profileDisplaySize == ProfileDisplaySize.mini) {
      throw Exception(
          'Live Profile Pic Does not support ProfileDisplaySize.mini');
    }
    late Animation<double> _scaleAnimation;
    late Animation<double> _fadeAnimation;
    if (tickerProvider != null) {
      late final AnimationController _controller = AnimationController(
        vsync: tickerProvider,
        duration: const Duration(milliseconds: 1000),
      )..repeat();
      _scaleAnimation =
          Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
      _fadeAnimation = Tween<double>(begin: 1, end: 0.2).animate(_controller);
    }

    EdgeInsets padding = EdgeInsets.all(2);
    return GestureDetector(
      onTap: () {
        if (onImageClicked != null) {
          onImageClicked!();
        }
      },
      child: Stack(
        children: [
          (tickerProvider != null)
              ? FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: getSizeFromProfileDisplaySize(profileDisplaySize),
                      height: getSizeFromProfileDisplaySize(profileDisplaySize),
                      decoration: BoxDecoration(
                        shape:
                            (profileDisplayShape == ProfileDisplayShape.circle)
                                ? BoxShape.circle
                                : BoxShape.rectangle,
                        color: ripplesColor,
                        borderRadius: (profileDisplayShape ==
                                ProfileDisplayShape.squareround)
                            ? BorderRadius.circular(10)
                            : null,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: 0,
                ),
          mainDisplay(padding: padding, isLive: true , badgeColor : badgeColor ),
          (showStatus)
              ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: (profileDisplaySize ==
                                    ProfileDisplaySize.large ||
                                profileDisplaySize == ProfileDisplaySize.medium)
                            ? 10
                            : 3,
                        horizontal: (profileDisplaySize ==
                                    ProfileDisplaySize.large ||
                                profileDisplaySize == ProfileDisplaySize.medium)
                            ? 15
                            : 5,
                      ),
                      decoration: BoxDecoration(
                          color: badgeColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        badgeText.toUpperCase(),
                        style: TextStyle(
                          fontSize: getBadgeFontSizeFromProfileDisplaySize(
                            profileDisplaySize,
                          ),
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
      ),
    );
  }

  Widget displayWithIcon(
      {Color iconBackgroundColor = Colors.grey,
      Color iconColor = Colors.black,
      IconData icon = Icons.upload,
      Color iconBorderColor = Colors.white,
      double iconBorderWidth = 0,
      required Function() onIconClicked}) {
    return GestureDetector(
      onTap: () {
        if (onImageClicked != null) {
          onImageClicked!();
        }
      },
      child: Stack(
        children: [
          mainDisplay(),
          Positioned(
            bottom: 0,
            right: (
                    profileDisplayShape == ProfileDisplayShape.circle)
                ? getMarginForBadge(profileDisplaySize)
                : 0,
            child: GestureDetector(
              onTap: () {
                onIconClicked();
              },
              child: Container(
                width:
                    getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize),
                height:
                    getIconBadgeSizeFromProfileDisplaySize(profileDisplaySize),
                decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: iconBorderColor, width: iconBorderWidth)),
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: getIconBadgeSizeFromProfileDisplaySize(
                            profileDisplaySize) -
                        5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget mainDisplay({EdgeInsets? padding, bool isLive = false , Color badgeColor = Colors.green}) {
    return Container(
      width: getSizeFromProfileDisplaySize(profileDisplaySize),
      height: getSizeFromProfileDisplaySize(profileDisplaySize),
      padding: (padding != null) ? padding : EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: backgoundColor,
        shape: (profileDisplayShape == ProfileDisplayShape.circle)
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: (profileDisplayShape == ProfileDisplayShape.squareround)
            ? BorderRadius.circular(10)
            : null,
        border: Border.all(
            color: (isLive)?badgeColor:  this.borderColor, width: borderWidth, style: BorderStyle.solid),
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
