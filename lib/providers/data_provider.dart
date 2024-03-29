import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_extractor/helpers/data_response.dart';
import 'package:text_extractor/services/services.dart';

class DataProvider extends ChangeNotifier {
  late DataResponse<String> extractedText;

  void pickImage({required ImageSource source}) async {
    extractedText = DataResponse.loading('Loading...');
    XFile? file = await Services.pickImage(source: source);
    if (file != null) {
      CroppedFile? croppedFile = await Services.cropImage(imagePath: file.path);
      if (croppedFile != null) {
        final data =
            await Services.extractText(inputImagePath: croppedFile.path);
        extractedText = DataResponse.completed(data);
        if (data.isEmpty) {
          extractedText = DataResponse.error("Error");
        }
      } else {
        extractedText = DataResponse.error("Error");
      }
    } else {
      extractedText = DataResponse.error("Error");
    }
    notifyListeners();
  }
}
