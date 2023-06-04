import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final PreferredSizeWidget? bottom;

  AppBarWidget({
    this.bottom,
    Key? key,
    this.title,
    this.titleColor,
  }) : super(key: key);

  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(
          56,
          56 + AppBar().preferredSize.height,
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      bottom: this.bottom,
      title: head(),
      automaticallyImplyLeading: true,
    );
  }

  Widget head() {
    if (title == null) {
      return Image.asset("assets/images/tusdata-logo.png", scale: 4);
    } else {
      return Text(
        title!,
        style: boldTextStyle(
          size: 20,
          color: titleColor ?? black,
        ),
        textAlign: TextAlign.start,
      ).paddingLeft(16);
    }
  }
}
