import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../app_svg.dart';

class DrawerItem extends StatelessWidget {
  final String label;
  final Function onTap;
  final String icon;
  final String? suffixText;

  const DrawerItem({
    Key? key,
    required this.label,
    required this.onTap,
    required this.icon,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        color: AppColor.white,
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.5),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  //AppSvg.asset(icon, width: 20, height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            suffixText != null
                ? Text(
                    suffixText!,
                    style: const TextStyle(fontSize: 12),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
