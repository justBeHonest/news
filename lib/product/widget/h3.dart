// Flutter imports:
import 'package:flutter/material.dart';

class H3 extends StatelessWidget {
  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle textStyle;
  const H3(
    this.data, {
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: textStyle.copyWith(
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
