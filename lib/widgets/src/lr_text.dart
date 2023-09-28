import 'package:catering_core/core.dart';
import 'package:flutter/material.dart';

class LRText extends StatelessWidget {
  final Either<String, Widget>? left;
  final Either<String, Widget>? right;
  final bool isUseDivider;
  const LRText({super.key, this.left, this.right, this.isUseDivider = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Builder(
              builder: (context) {
                if (left != null) {
                  return left!.fold(
                      (l) => MainText(
                            l,
                            style: TextStyle(
                                fontSize: context.fontSize(20, max: 16)),
                          ),
                      (r) => r);
                }
                return const SizedBox();
              },
            )),
            Expanded(child: Builder(
              builder: (context) {
                if (right != null) {
                  return right!.fold(
                      (l) => MainText(
                            l,
                            style: TextStyle(
                                fontSize: context.fontSize(20, max: 16)),
                          ),
                      (r) => r);
                }
                return const SizedBox();
              },
            ))
          ],
        ),
        if (isUseDivider) 10.v,
        if (isUseDivider)
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
      ],
    );
  }
}
