import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_read_id_card_app/constants/app_constant.dart';
import 'package:flutter_read_id_card_app/models/back_card_model.dart';
import 'package:flutter_read_id_card_app/models/front_card_model.dart';
import 'package:flutter_read_id_card_app/provider/id_card_provider.dart';
import 'package:flutter_read_id_card_app/utils/functions/show_snackbar_message.dart';
import 'package:flutter_read_id_card_app/utils/helpers/image_picker_helper.dart';
import 'package:flutter_read_id_card_app/widgets/custom_button.dart';
import 'package:flutter_read_id_card_app/widgets/custom_field_result_row.dart';
import 'package:flutter_read_id_card_app/widgets/custom_show_modal_bottomsheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? frontCardFile;
  File? backCardFile;
  @override
  void initState() {
    super.initState();
  }

  _buildFileSelectionFunction({
    required bool isFrontCard,
  }) {
    return customShowModalBottomSheet(
        bottomSheetBody: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () async {
                var imagePicker = ImagePickerHelper();
                await imagePicker.pickImageGallery();
                if (imagePicker.imageFile != null) {
                  if (isFrontCard == true) {
                    setState(() {
                      frontCardFile = imagePicker.imageFile;
                      // debugPrint("front card file: $frontCardFile");
                    });
                  } else {
                    setState(() {
                      backCardFile = imagePicker.imageFile;
                      // debugPrint("back card file: $frontCardFile");
                    });
                  }
                }
                Navigator.pop(context);
              },
              leading: const Icon(Icons.photo),
              title: const Text("Upload photo"),
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              height: 1,
              color: Colors.black26,
            ),
            ListTile(
              onTap: () async {
                var imagePicker = ImagePickerHelper();
                await imagePicker.takeImageCamera();
                if (imagePicker.imageFile != null) {
                  if (isFrontCard == true) {
                    setState(() {
                      frontCardFile = imagePicker.imageFile;
                    });
                    // debugPrint("front card file: $frontCardFile");
                  } else {
                    setState(() {
                      backCardFile = imagePicker.imageFile;
                    });
                    // debugPrint("front card file: $frontCardFile");
                  }
                }
                Navigator.pop(context);
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take photo"),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
        context: context);
  }

  _buildShowFrontCardInfoPart({required FrontCardModel frontCardModel}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            "Front part:",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppConstant.primaryColor),
          ),
        ),
        Center(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26, width: 1),
          ),
          child: Image.memory(
            base64Decode(frontCardModel.face!),
            fit: BoxFit.fitWidth,
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomFieldResultRow(
                  leftText: 'Field',
                  rightText: "Result",
                  topPadding: 20,
                  isTextBold: true,
                ),
                CustomFieldResultRow(
                  leftText: "เลขประจำตัวบัตรประชาชน",
                  rightText: "${frontCardModel.idNumber}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "คำนำหน้า (ไทย)",
                  rightText: "${frontCardModel.thInit}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "ชื่อ (ไทย)",
                  rightText: "${frontCardModel.thFname}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "นามสกุล (ไทย)",
                  rightText: "${frontCardModel.thLname}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "Title (Eng)",
                  rightText: "${frontCardModel.enInit}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "Name (Eng)",
                  rightText: "${frontCardModel.enFname}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "Last name (Eng)",
                  rightText: "${frontCardModel.enLname}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "เกิดวันที่ (ไทย)",
                  rightText: "${frontCardModel.thDob}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "Birthdate (Eng)",
                  rightText: "${frontCardModel.enDob}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "ที่อยู่ (ไทย)",
                  rightText: "${frontCardModel.address}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "Gender",
                  rightText: "${frontCardModel.gender}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "วันออกบัตร (ไทย)",
                  rightText: "${frontCardModel.thIssue}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "Issue Date (Eng)",
                  rightText: "${frontCardModel.enIssue}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "วันบัตรหมดอายุ (ไทย)",
                  rightText: "${frontCardModel.thExpire}",
                  topPadding: 10,
                  isTextBold: false,
                ),
                CustomFieldResultRow(
                  leftText: "Expiry Date (Eng)",
                  rightText: "${frontCardModel.enExpire}",
                  topPadding: 10,
                  isTextBold: false,
                ),
              ]),
        ),
      ],
    );
  }

  _buildShowBackCardInfoPart({required BackCardModel backCardModel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Back part:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppConstant.primaryColor),
            ),
          ),
          const CustomFieldResultRow(
            leftText: 'Field',
            rightText: "Result",
            topPadding: 20,
            isTextBold: true,
          ),
          CustomFieldResultRow(
            leftText: 'Back number',
            rightText: "${backCardModel.backNumber}",
            topPadding: 20,
            isTextBold: false,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ID Card Reader")),
      body: Consumer<IdCardProvider>(
        builder: (context, idCardProvider, child) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              if (idCardProvider.errorMsg != '') {
                showMessage(message: idCardProvider.errorMsg, context: context);
                idCardProvider.clearErrorMsg();
              }
            },
          );
          if (idCardProvider.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: CustomButton(
                        onPressed: () async {
                          await _buildFileSelectionFunction(isFrontCard: true);
                          if (frontCardFile != null) {
                            await idCardProvider.getFrontCardInfo(
                                imageFile: XFile(frontCardFile!.path));
                          }
                        },
                        buttonText: "Upload front card image",
                        borderRadius: 14,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: CustomButton(
                        onPressed: () async {
                          await _buildFileSelectionFunction(isFrontCard: false);
                          if (backCardFile != null) {
                            await idCardProvider.getBackCardInfo(
                                imageFile: XFile(backCardFile!.path));
                          }
                        },
                        buttonText: "Upload back card image",
                        borderRadius: 14,
                      ),
                    ),
                    if (idCardProvider.frontCardData != null)
                      _buildShowFrontCardInfoPart(
                          frontCardModel: idCardProvider.frontCardData!),
                    if (idCardProvider.backCardData != null)
                      _buildShowBackCardInfoPart(
                          backCardModel: idCardProvider.backCardData!)
                  ]),
            );
          }
        },
      ),
    );
  }
}
