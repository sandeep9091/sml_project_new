import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../utils/color_utils.dart';

class ApproveStatusWidget extends StatelessWidget {
  final String status;
  const ApproveStatusWidget({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
      decoration: BoxDecoration(
        color: (status=="A"||status=="D")?AppColor.green.withOpacity(0.5):status=="P"?AppColor.yellow.withOpacity(0.5):(status=="R"||status=="C")?AppColor.red.withOpacity(0.5):AppColor.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(5.0))
      ),
      child: status=="A"?const Text("APPROVED",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.green,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ):(status=="D")?const Text("DISBURSED",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.green,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ):(status=="P")?const Text("PENDING",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.yellow,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ):(status=="R")?const Text("REJECTED",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.red,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ):(status=="C")?const Text("CANCEL",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.red,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible
                  ),
                ): const SizedBox()
    
    );
  }
}
