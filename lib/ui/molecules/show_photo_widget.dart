import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spoorthymactcs/ui/molecules/show_full_image.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';

class ShowPhotoWidget extends StatelessWidget {
  const ShowPhotoWidget({super.key, required this.title, required this.base64Data, required this.onTap});
  final String title;
  final String base64Data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .25,
            child: Text(title??"", style: TextStyle(color: AppColor.primaryText,fontSize: 15,fontWeight: FontWeight.w500))),
          const SizedBox(width: 20),
          Container(
              height: 50,
              width: 40,
              //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                //borderRadius: const BorderRadius.all(Radius.circular(90.0)),
                border: Border.all(color: AppColor.primary)
              ),
              child: SizedBox(
              child: renderImageFromString(base64Data,context))),
          const SizedBox(width: 20),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 25,
              width: 70,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.clear,color: AppColor.white,size: 15),
                  Text("Clear",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 15,
                                  fontFamily: FontUtils.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                ],
              ),
                    ),
          ),
                        
        ],);
  }
}

Widget renderImageFromString(String data, BuildContext context){
  if(data.isNotEmpty && data.contains("data:image")){
    List splitString = data.split(",");
    if(splitString.length>1){
      return InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ShowFullImage(imageData: splitString[1])));
        },
        child: Image.memory(base64Decode(splitString[1])));
    }else{
      return const Text("Unsupported Format");
    }
  }else{
    if(data.isNotEmpty){
      return InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ShowFullImage(imageData: data)));
        },
        child: Image.memory(base64Decode(data)));
    }else{
      return const Text("No Image Data");
    }
  }
}