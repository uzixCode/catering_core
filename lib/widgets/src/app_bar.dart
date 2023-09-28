import 'package:flutter/material.dart';

import 'package:catering_core/core.dart';

class AlfaAppBar extends StatelessWidget {
  const AlfaAppBar({
    Key? key,
    this.title,
    this.isBack,
  }) : super(key: key);
  final String? title;
  final bool? isBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.rsize(.13),
      child: PhysicalModel(
        color: Colors.grey,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 5,
          color: BaseColor.primary,
          // shadowColor: Colors.white,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isBack == true)
                  InkWell(
                      onTap: () => context.pop(),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: context.rsize(.08),
                      )),
                if (title != null)
                  MainText(
                    title,
                    style: TextStyle(
                        fontSize: context.fontSize(17), color: Colors.white),
                  ),
                const Expanded(child: SizedBox()),
                Image.asset(
                  "assets/alfa_logo_white.png",
                  cacheWidth: 165,
                  cacheHeight: 96,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
