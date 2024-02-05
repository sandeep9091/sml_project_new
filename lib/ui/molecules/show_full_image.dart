import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowFullImage extends StatelessWidget {
  const ShowFullImage({super.key,required this.imageData});
  final String imageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back)),
      ),
      body: WillPopScope(
        onWillPop: () async {
          context.pop();
          return true;
        },
        child: Center(child: Image.memory(base64Decode(imageData)))),
    );
  }
}