import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../utils/color_utils.dart';

class CommonEditViewButton extends StatelessWidget {
  final Function()? editButtonAction;
  final Function()? viewButtonAction;
  const CommonEditViewButton({
    super.key,
    required this.editButtonAction,
    required this.viewButtonAction
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 1),
      //color: Colors.red,
      width: MediaQuery.of(context).size.width *.17,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            InkWell(
              onTap: editButtonAction,
              child: const SizedBox(width: 22, height: 20, child: Icon(Icons.edit,size: 20,color: AppColor.grey,)),
            ),
            const SizedBox(width: 5,),
            InkWell(
              onTap: viewButtonAction,
              child: const SizedBox(width: 22, height: 20, child: Icon(Icons.remove_red_eye,size: 20,color: AppColor.grey,)),
            ),
        ],
      )
    );
  }
}
