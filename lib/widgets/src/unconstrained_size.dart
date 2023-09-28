import 'package:flutter/material.dart';

class UnconstrainedSize extends StatelessWidget {
  const UnconstrainedSize({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [child],
    );
  }
}
