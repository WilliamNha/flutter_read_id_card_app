import 'package:flutter/material.dart';
import 'package:flutter_read_id_card_app/models/back_card_model.dart';
import 'package:flutter_read_id_card_app/models/front_card_model.dart';
import 'package:flutter_read_id_card_app/services/id_card_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';

class IdCardProvider extends ChangeNotifier {
  FrontCardModel? frontCardData;
  BackCardModel? backCardData;
  bool isLoading = false;
  String errorMsg = '';

  Future getFrontCardInfo({
    required XFile imageFile,
  }) async {
    frontCardData = null;
    final idCardService = IdCardService();
    isLoading = true;
    notifyListeners();
    try {
      await idCardService.getFrontCardInfo(imageFile: imageFile).then((value) {
        if (idCardService.errorMsg == '') {
          frontCardData = FrontCardModel.fromJson(value);

          debugPrint("front card data: ${frontCardData!.enName}");
        } else {
          errorMsg = idCardService.errorMsg;
          idCardService.clearErrorMsg();
        }
      });
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getBackCardInfo({
    required XFile imageFile,
  }) async {
    backCardData = null;
    final idCardService = IdCardService();
    isLoading = true;
    notifyListeners();
    try {
      await idCardService.getBackCardInfo(imageFile: imageFile).then((value) {
        if (idCardService.errorMsg == '') {
          backCardData = BackCardModel.fromJson(value);
        } else {
          errorMsg = idCardService.errorMsg;
          idCardService.clearErrorMsg();
        }
      });
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  clearErrorMsg() {
    errorMsg = '';
  }
}
