import 'package:flutter/material.dart';
import 'package:flutter_read_id_card_app/constants/app_constant.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppConstant.primaryColor));
}
