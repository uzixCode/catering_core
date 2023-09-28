import 'package:flutter/material.dart';

enum ChildrenState { one, two }

// ignore: must_be_immutable
class SwitcherChildrenToChildren extends StatelessWidget {
  SwitcherChildrenToChildren(
      {super.key,
      required this.children,
      required this.state,
      required this.builderOne,
      required this.builderTwo});
  List<Widget> children;
  ChildrenState state;
  Widget Function(List<Widget> children) builderOne;
  Widget Function(List<Widget> children) builderTwo;
  @override
  Widget build(BuildContext context) {
    if (state == ChildrenState.one) {
      return builderOne(children);
    }
    return builderTwo(children);
  }
}
