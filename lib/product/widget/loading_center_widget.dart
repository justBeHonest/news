import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class LoadingCenterWidget extends StatelessWidget {
  const LoadingCenterWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator().center();
  }
}
