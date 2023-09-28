import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseCard extends StatelessWidget {
  BaseCard(
      {Key? key,
      this.child,
      this.color,
      this.shadowColor,
      this.surfaceTintColor,
      this.elevation,
      this.shape,
      this.borderOnForeground,
      this.margin,
      this.clipBehavior})
      : super(key: key);
  Widget? child;
  Color? color;
  Color? shadowColor;
  Color? surfaceTintColor;
  double? elevation;
  ShapeBorder? shape;
  bool? borderOnForeground;
  EdgeInsetsGeometry? margin;
  Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: margin,
      borderOnForeground: borderOnForeground ?? true,
      clipBehavior: clipBehavior,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      surfaceTintColor: surfaceTintColor,
      child: child,
    );
  }
}
