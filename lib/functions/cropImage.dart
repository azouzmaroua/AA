import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;

Future CropImage(context, var pikedImage) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: pikedImage.path,
    compressFormat: ImageCompressFormat.png,
    compressQuality: 1,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.grey,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
        showCropGrid: true,
        hideBottomControls: true,
      ),
      IOSUiSettings(
        title: 'Cropper',
      ),
      WebUiSettings(
        context: context,
        presentStyle: CropperPresentStyle.dialog,
        boundary: const CroppieBoundary(
          width: 520,
          height: 520,
        ),
        viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
        enableExif: false,
        enableZoom: false,
        showZoomer: false,
      ),
    ],
  );

  return croppedFile;
}
