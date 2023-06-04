// Flutter imports:
import 'package:flutter/cupertino.dart';

class H2 extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color? color;
  final double? width;
  final double? height;

  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const H2(
    this.text, {
    Key? key,
    this.fontWeight,
    this.color,
    this.height,
    this.width,
    this.textAlign,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(
        text,
        style: textStyle.copyWith(
          fontSize: 24,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
