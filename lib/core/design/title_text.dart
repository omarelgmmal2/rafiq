import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String label;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? style;
  final TextDirection? textDirection;

  const CustomTextWidget({
    super.key,
    required this.label,
    this.textAlign,
    this.maxLines, this.style,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: textDirection,
      maxLines: maxLines,
      textAlign: textAlign,
      label,
      style: style,
    );
  }
}
