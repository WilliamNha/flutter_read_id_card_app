import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_read_id_card_app/constants/app_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class IdCardService {
  String errorMsg = '';
  Future<dynamic> getFrontCardInfo({
    required XFile imageFile,
  }) async {
    final url = Uri.parse('${AppConstant.baseUrl}/front');

    var request = http.MultipartRequest('POST', url);
    request.headers['apikey'] = AppConstant.apiKey;

    var file = await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
    );

    request.files.add(file);
    var response = await request.send();
    try {
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = utf8.decode(responseData);
        return json.decode(responseString);
      } else {
        debugPrint('Error: ${response.statusCode} ${response.reasonPhrase}');
        var responseData = await response.stream.toBytes();
        var responseString = utf8.decode(responseData);
        errorMsg = json.decode(responseString)['error_message'];
        debugPrint("Error msg: $errorMsg");
        return errorMsg;
      }
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

  Future<dynamic> getBackCardInfo({
    required XFile imageFile,
  }) async {
    final url = Uri.parse('${AppConstant.baseUrl}/back');

    var request = http.MultipartRequest('POST', url);
    request.headers['apikey'] = AppConstant.apiKey;

    var file = await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
    );

    request.files.add(file);
    var response = await request.send();
    try {
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = utf8.decode(responseData);
        return json.decode(responseString);
      } else {
        debugPrint('Error: ${response.statusCode} ${response.reasonPhrase}');
        var responseData = await response.stream.toBytes();
        var responseString = utf8.decode(responseData);
        errorMsg = json.decode(responseString)['error_message'];
        debugPrint("Error msg: $errorMsg");
        return errorMsg;
      }
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

  clearErrorMsg() {
    errorMsg = '';
  }
}
