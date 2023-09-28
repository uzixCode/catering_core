import 'package:catering_core/core.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.onPressed,
      this.child,
      this.style,
      this.isLoading,
      this.loadingWidget,
      this.isDisable});
  final void Function()? onPressed;
  final ButtonStyle? style;
  final Either<String, Widget>? child;
  final bool? isLoading;
  final Widget? loadingWidget;
  final bool? isDisable;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
            style: style == null
                ? ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStatePropertyAll(
                        isLoading == true || isDisable == true
                            ? Colors.grey
                            : BaseColor.primary))
                : style!.copyWith(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: isLoading == true || isDisable == true
                        ? const MaterialStatePropertyAll(Colors.grey)
                        : style?.backgroundColor ??
                            const MaterialStatePropertyAll(BaseColor.primary)),
            onPressed:
                isLoading == true || isDisable == true ? null : onPressed,
            child: isLoading == true
                ? loadingWidget ??
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 5),
                      child: SizedBox(
                        // width: context.fontSize(25, max: 25),
                        height: context.fontSize(25, max: 25),
                        child: const RiveAnimation.asset(
                          "assets/anim/loading.riv",
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                : child?.fold(
                    (l) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: MainText(
                            l,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: context.fontSize(25, max: 25)),
                          ),
                        ),
                    (r) => r))
        .animate();
  }
}
