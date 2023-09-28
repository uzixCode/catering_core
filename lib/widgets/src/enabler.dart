import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Enabler extends StatelessWidget {
  Enabler({Key? key, required this.child, this.builder, this.isEnable = true})
      : super(key: key);
  Widget child;
  bool isEnable;
  Widget Function(BuildContext context, Widget child, bool isEnable)? builder;
  @override
  Widget build(BuildContext context) {
    if (!isEnable || builder == null) {
      return child;
    }
    return builder!(context, child, isEnable);
  }
}
