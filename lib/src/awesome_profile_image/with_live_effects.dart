import 'package:flutter/material.dart';
import 'package:flutter_awesome_ui_kit/flutter_awesome_ui_kit.dart';
import 'package:flutter_awesome_ui_kit/src/awesome_profile_image/awesome_profile_image_utils.dart';

class WithLiveEffects extends StatefulWidget implements AwesomeProfileImage {
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
  final Color badgeColor;
  final Color ripplesColor;
  final String badgeText;

  const WithLiveEffects({
    super.key,
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
    this.badgeColor = Colors.green,
    this.ripplesColor = const Color.fromARGB(255, 129, 199, 132),
    this.badgeText = "Live",
  });

  @override
  State<WithLiveEffects> createState() => _WithLiveEffectsState();
}

class _WithLiveEffectsState extends State<WithLiveEffects>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    late Animation<double> scaleAnimation;
    late Animation<double> fadeAnimation;

    late final AnimationController controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(controller);
    fadeAnimation = Tween<double>(begin: 1, end: 0.2).animate(controller);

    EdgeInsets padding = const EdgeInsets.all(2);

    return GestureDetector(
      onTap: () {
        if (widget.onImageClicked != null) {
          widget.onImageClicked!();
        }
      },
      child: Stack(
        children: [
          FadeTransition(
            opacity: fadeAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: getSizeFromProfileDisplaySize(widget.profileDisplaySize),
                height:
                    getSizeFromProfileDisplaySize(widget.profileDisplaySize),
                decoration: BoxDecoration(
                  shape:
                      (widget.profileDisplayShape == ProfileDisplayShape.circle)
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                  color: widget.ripplesColor,
                  borderRadius: (widget.profileDisplayShape ==
                          ProfileDisplayShape.squareround)
                      ? BorderRadius.circular(10)
                      : null,
                ),
              ),
            ),
          ),
          Container(
            width: getSizeFromProfileDisplaySize(widget.profileDisplaySize),
            height: getSizeFromProfileDisplaySize(widget.profileDisplaySize),
            padding: padding,
            decoration: BoxDecoration(
              color: widget.backgoundColor,
              shape: (widget.profileDisplayShape == ProfileDisplayShape.circle)
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              borderRadius: (widget.profileDisplayShape ==
                      ProfileDisplayShape.squareround)
                  ? BorderRadius.circular(10)
                  : null,
              border: Border.all(
                  color: widget.badgeColor,
                  width: widget.borderWidth,
                  style: BorderStyle.solid),
            ),
            child: (widget.imageUrl != null)
                ? SizedBox(
                    width: getSizeFromProfileDisplaySize(
                        widget.profileDisplaySize),
                    height: getSizeFromProfileDisplaySize(
                        widget.profileDisplaySize),
                    child: (widget.profileDisplayShape ==
                            ProfileDisplayShape.circle)
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                              widget.imageUrl!,
                            ),
                          )
                        : SizedBox(
                            width: getSizeFromProfileDisplaySize(
                                widget.profileDisplaySize),
                            height: getSizeFromProfileDisplaySize(
                                widget.profileDisplaySize),
                            child: (widget.profileDisplayShape ==
                                    ProfileDisplayShape.squareround)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      widget.imageUrl!,
                                    ),
                                  )
                                : Image.network(
                                    widget.imageUrl!,
                                  ),
                          ),
                  )
                : SizedBox(
                    width: getSizeFromProfileDisplaySize(
                        widget.profileDisplaySize),
                    height: getSizeFromProfileDisplaySize(
                        widget.profileDisplaySize),
                    child: Container(
                        child: (widget.placeholderAssets != null)
                            ? getPlaceholder()
                            : Icon(
                                Icons.person,
                                size: getSizeFromProfileDisplaySize(
                                    widget.profileDisplaySize),
                              )),
                  ),
          ),
          (widget.showStatus)
              ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: (widget.profileDisplaySize ==
                                    ProfileDisplaySize.large ||
                                widget.profileDisplaySize ==
                                    ProfileDisplaySize.medium)
                            ? 10
                            : 3,
                        horizontal: (widget.profileDisplaySize ==
                                    ProfileDisplaySize.large ||
                                widget.profileDisplaySize ==
                                    ProfileDisplaySize.medium)
                            ? 15
                            : 5,
                      ),
                      decoration: BoxDecoration(
                          color: widget.badgeColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        widget.badgeText.toUpperCase(),
                        style: TextStyle(
                          fontSize: getBadgeFontSizeFromProfileDisplaySize(
                            widget.profileDisplaySize,
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

  Widget getPlaceholder() {
    return (widget.profileDisplayShape == ProfileDisplayShape.circle)
        ? CircleAvatar(
            backgroundImage: Image.asset(widget.placeholderAssets!).image,
          )
        : SizedBox(
            width: getSizeFromProfileDisplaySize(widget.profileDisplaySize),
            height: getSizeFromProfileDisplaySize(widget.profileDisplaySize),
            child:
                (widget.profileDisplayShape == ProfileDisplayShape.squareround)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(widget.placeholderAssets!),
                      )
                    : Image.asset(widget.placeholderAssets!),
          );
  }
}
