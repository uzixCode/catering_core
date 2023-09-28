import 'package:flutter/material.dart';

import '../../static/src/colors.dart';
import '../../static/src/dimensions.dart';
import 'small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double? textHeight;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textHeight = Dimensions.screenHeight(context) / 5.63;
    if (widget.text.length > (textHeight ?? 0)) {
      firstHalf = widget.text.substring(0, (textHeight?.toInt() ?? 0));
      secondHalf = widget.text
          .substring((textHeight?.toInt() ?? 0) + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              color: AppColors.paraCOlor,
              size: Dimensions.font16(context),
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                    height: 1.8,
                    color: AppColors.paraCOlor,
                    size: Dimensions.font16(context),
                    text: hiddenText
                        ? ("$firstHalf...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
