import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  File? imageFile;
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      imageFile = imageTemp;
      debugPrint('image path: ${image.path}');
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return imageFile;
  }

  Future takeImageCamera() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 25);
      if (image == null) return;
      final imageTemp = File(image.path);
      imageFile = imageTemp;
      debugPrint('image path: ${image.path}');
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return imageFile;
  }
}
