// import 'dart:html';

// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Services {
  static final textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  static final ImagePicker picker = ImagePicker();

  static Future<String> extractText({required inputImagePath}) async {
    final inputImage = InputImage.fromFilePath(inputImagePath);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    return recognizedText.text;
  }

  static Future<XFile?> pickImage({required ImageSource source}) async {
    final XFile? image = await picker.pickImage(source: source);
    return image;
  }

  static Future<CroppedFile?> cropImage({required String imagePath}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );
    return croppedFile;
  }
}
