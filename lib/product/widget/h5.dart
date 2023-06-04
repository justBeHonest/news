import 'package:flutter/material.dart';

class H5 extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  const H5(
    this.text, {
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 13,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
