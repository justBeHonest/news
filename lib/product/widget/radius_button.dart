import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news/product/utility/theme/colors.dart';

class RadiusButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final FontWeight? fontWeight;
  final Color? textColor;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Color? borderSideColor;
  final Color? backGroundColor;
  final double? height;
  final int? textSize;
  final double? width;
  const RadiusButton({
    Key? key,
    this.height,
    this.width,
    this.textSize,
    this.fontWeight,
    this.backGroundColor,
    this.borderSideColor,
    this.rightIcon,
    this.textColor,
    required this.onPressed,
    required this.text,
    this.leftIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(width: 2, color: borderSideColor ?? mlPrimaryColor),
        ),
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all(
          backGroundColor ?? mlPrimaryColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftIcon != null
              ? Icon(
                  leftIcon,
                  size: 24,
                  color: white,
                ).paddingRight(8)
              : SizedBox(),
          Text(
            text,
            style: boldTextStyle(
              color: textColor ?? white,
              weight: fontWeight,
              size: textSize,
            ),
          ),
          rightIcon != null
              ? Icon(
                  rightIcon,
                  size: 18,
                  color: white,
                ).paddingLeft(8)
              : SizedBox(),
        ],
      ).paddingSymmetric(
        vertical: height ?? 15,
        horizontal: width ?? 0,
      ),
    );
  }
}
