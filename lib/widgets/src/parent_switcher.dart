import 'package:flutter/material.dart';

class ParentSwitcher extends StatelessWidget {
  const ParentSwitcher({
    super.key,
    required this.parents,
    this.child,
    this.index,
  });
  final List<Widget Function(Widget child)>? parents;
  final Widget? child;
  final int? index;
  @override
  Widget build(BuildContext context) {
    if (parents == null || parents!.isEmpty || child == null || index == null) {
      return const SizedBox.shrink();
    }
    return parents![index!](child!);
  }
}
