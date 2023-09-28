import 'package:flutter/material.dart';

import '../../static/src/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2d),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimensions.font20(context) : size,
          fontWeight: FontWeight.w400),
    );
  }
}
