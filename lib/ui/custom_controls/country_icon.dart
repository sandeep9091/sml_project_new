import 'package:flutter/material.dart';

import '../../utils/asset_utils.dart';

class CountryIcon extends StatelessWidget {
  const CountryIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(maxHeight: 44, minHeight: 44, minWidth: 44),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetUtils.indianFlag,
            fit: BoxFit.fitHeight,
            height: 12,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "+91",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 2,
          ),
        ],
      ),
    );
  }
}
