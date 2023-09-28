import 'package:flutter/material.dart';

import '../../static/src/colors.dart';
import '../../static/src/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int? est;
  const AppColumn({Key? key, required this.text, required this.est})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BigText(
            text: text,
            overflow: TextOverflow.ellipsis,
            size: Dimensions.font26(context),
          ),
        ),
        IconAndTextWidget(
            icon: Icons.access_time_rounded,
            text: "${est}min",
            iconColor: AppColors.iconColor2),
      ],
    );
  }
}
