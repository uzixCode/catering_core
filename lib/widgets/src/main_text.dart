import 'package:catering_core/core.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText(this.text,
      {super.key, this.style, this.textAlign, this.maxLines});
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "-",
      textAlign: textAlign,
      maxLines: maxLines,
      style: style?.copyWith(
        fontFamily:
            style?.fontFamily ?? GoogleFonts.robotoCondensed().fontFamily,
      ),
    );
  }
}
