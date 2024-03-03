import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../utils/color_utils.dart';

class CommonEditViewButton extends StatelessWidget {
  final bool showEditButton;
  final bool showViewButton;
  final bool isHistoryIcon;
  final Function()? editButtonAction;
  final Function()? viewButtonAction;
  const CommonEditViewButton({
    super.key,
    required this.editButtonAction,
    required this.viewButtonAction,
    this.showEditButton = true,
    this.showViewButton = true,
    this.isHistoryIcon = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
      //color: Colors.red,
      width: MediaQuery.of(context).size.width *.17,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
            Visibility(
              visible: showEditButton,
              child: InkWell(
                onTap: editButtonAction,
                child: const SizedBox(width: 22, height: 20, child: Icon(Icons.edit,size: 20,color: AppColor.grey,)),
              ),
            ),
            const SizedBox(width: 5,),
            Visibility(
              visible: showViewButton || isHistoryIcon,
              child: InkWell(
                onTap: viewButtonAction,
                child: SizedBox(width: 22, height: 20, child: Icon(isHistoryIcon?Icons.history:Icons.remove_red_eye,size: 20,color: AppColor.grey,)),
              ),
            ),
        ],
      )
    );
  }
}
