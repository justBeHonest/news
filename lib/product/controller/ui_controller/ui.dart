// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news/product/utility/theme/colors.dart';
import 'package:news/product/widget/h3.dart';
import 'package:news/product/widget/radius_button.dart';

class UI {
  static setStatusBarPrimaryColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mlPrimaryColor,
    ));
  }

  static Future showErrorDialog({
    required BuildContext context,
    required String content,
    String? header,
    Function? callback,
    bool barrierDismissible = true,
  }) =>
      showDialog(
          barrierDismissible: barrierDismissible,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(header ?? "Error"),
              content: Text(content),
              actions: [
                AppButton(
                  color: appColorPrimary,
                  textColor: white,
                  text: 'Ok',
                  onTap: callback ??
                      () {
                        Navigator.of(context).pop();
                      },
                ),
              ],
            );
          });

  static Future showAlertDialog(BuildContext context, String message) =>
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(message),
            );
          });

  static Widget circularProgress() {
    if (GetPlatform.isIOS) {
      return const CupertinoActivityIndicator().center();
    } else {
      return const CircularProgressIndicator().center();
    }
  }

  static Widget circularProgressWith({
    required bool loading,
    required Widget child,
  }) {
    if (!loading) {
      return child;
    }

    if (GetPlatform.isIOS) {
      return const CupertinoActivityIndicator().center();
    } else {
      return const CircularProgressIndicator().center();
    }
  }

  static Future<bool> showAreYouSureDialog(
    BuildContext context,
    String title,
  ) async {
    bool result = false;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          content: H3(
            title,
            fontWeight: FontWeight.normal,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RadiusButton(
                  width: context.dynamicWidth(0.08),
                  text: 'Yes',
                  onPressed: () {
                    result = true;
                    Get.back();
                  },
                ),
                RadiusButton(
                  width: context.dynamicWidth(0.08),
                  borderSideColor: mlGreyColor,
                  textColor: black,
                  backGroundColor: mlGreyColor,
                  text: 'No',
                  onPressed: () async {
                    result = false;
                    Get.back();
                  },
                ),
              ],
            ),
            30.height,
          ],
        );
      },
    );
    return result;
  }
}
