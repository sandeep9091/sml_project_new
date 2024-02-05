// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:spoorthymactcs/ui/app_svg.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import '../../../../utils/asset_utils.dart';
import '../../../../utils/font_utils.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerBottomSheetPage extends StatelessWidget {
  const PhotoPickerBottomSheetPage(this.callback, {super.key});
  final void Function(File) callback;

  Future getImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final selectedImage = File(image.path);
      File? croppedImage = File(image.path);
      //croppedImage = await cropImage(context, imageFile: croppedImage);
      //if (croppedImage == null) return;
      //final savedImage = await saveFile(croppedImage!.path);
      return callback(croppedImage);
    } on PlatformException catch (e) {
      debugPrint('Faild to pick image: $e');
    }
  }

  Future<File?> cropImage(BuildContext context,
      {required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              toolbarWidgetColor: AppColor.grey,
              initAspectRatio: CropAspectRatioPreset.original,
              hideBottomControls: true,
              lockAspectRatio: false),
          IOSUiSettings(
              title: '',
              cancelButtonTitle: 'Cancel',
              doneButtonTitle: 'Done',
              hidesNavigationBar: true),
        ],
        cropStyle: CropStyle.rectangle);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future<File> saveFile(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Photo",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontFamily: FontUtils.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  InkWell(
                      onTap: () => getImage(ImageSource.gallery, context),
                      child: AppSvg.asset(AssetUtils.gallery)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Gallery",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontUtils.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  InkWell(
                      onTap: () => getImage(ImageSource.camera, context),
                      child: AppSvg.asset(AssetUtils.camera)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Camera",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontUtils.primary,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
