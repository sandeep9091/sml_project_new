import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../utils/color_utils.dart';

class ActiveStatusWidget extends StatelessWidget {
  final bool status;
  const ActiveStatusWidget({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 1),
      child: status?const Text("Active",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.green,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ):(!status)?const Text("Inactive",
                  style:  TextStyle(
                    fontSize: 14,
                    color: AppColor.red,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ):const SizedBox.shrink()
    
    );
  }
}
