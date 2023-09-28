import 'package:flutter/material.dart';

class WidgetSwitcher extends StatelessWidget {
  const WidgetSwitcher({super.key, this.children, this.index});
  final List<Widget>? children;
  final int? index;
  @override
  Widget build(BuildContext context) {
    if (children == null || children!.isEmpty || index == null) {
      return const SizedBox.shrink();
    }
    return children![index!];
  }
}
