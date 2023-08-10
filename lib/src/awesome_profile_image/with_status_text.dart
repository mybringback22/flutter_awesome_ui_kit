import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/flutter_awesome_ui_kit.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/awesome_profile_image_utils.dart';

class WithStatusText extends StatelessWidget implements AwesomeProfileImage {
  final ProfileDisplaySize profileDisplaySize;
  final Color borderColor;
  final Color backgoundColor;
  final String? imageUrl;
  final double borderWidth;
  final String? placeholderAssets;
  final ProfileDisplayShape profileDisplayShape;
  final Function()? onImageClicked;

  final UserStatus? userStatus;
  final bool showStatus;
  final Color? customStatusColor;

  const WithStatusText(
      {super.key,
      this.profileDisplaySize = ProfileDisplaySize.medium,
      this.profileDisplayShape = ProfileDisplayShape.square,
      this.borderColor = Colors.white,
      this.backgoundColor = Colors.grey,
      this.imageUrl,
      this.borderWidth = 0,
      this.placeholderAssets,
      this.onImageClicked,
      this.userStatus = UserStatus.offline,
      this.showStatus = false,
      this.customStatusColor});

  @override
  Widget build(BuildContext context) {
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


  Widget mainDisplay({EdgeInsets? padding, bool isLive = false , Color badgeColor = Colors.green , }) {
    return Container(
      width: getSizeFromProfileDisplaySize(profileDisplaySize),
      height: getSizeFromProfileDisplaySize(profileDisplaySize),
      padding: (padding != null) ? padding : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: backgoundColor,
        shape: (profileDisplayShape == ProfileDisplayShape.circle)
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: (profileDisplayShape == ProfileDisplayShape.squareround)
            ? BorderRadius.circular(10)
            : null,
        border: Border.all(
            color: (isLive)?badgeColor: borderColor, width: borderWidth, style: BorderStyle.solid),
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
