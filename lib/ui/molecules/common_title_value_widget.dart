import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../utils/color_utils.dart';

class CommonTitleValueWidget extends StatelessWidget {
  final String? title;
  final String value;
  final double width;
  const CommonTitleValueWidget({
    super.key,
    this.title,
    required this.value,
    this.width = double.infinity
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 1),
      width: width,
      child: RichText(
            text: TextSpan(
              text: (title!=null)?"$title: ":"",
              style: const TextStyle(
                fontSize: 12,
                color: AppColor.semiGrey,
                fontFamily: FontUtils.primary,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.semiBlack,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ),
              ],
            ),
    ));
  }
}
