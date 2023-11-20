import 'package:flutter/material.dart';

Future<dynamic> customShowModalBottomSheet({
  bool isHasRadius = true,
  Color backgroundColor = Colors.white,
  bool isHasBarIcon = true,
  required Widget bottomSheetBody,
  required BuildContext context,
}) {
  return showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(isHasRadius ? 20 : 0),
      )),
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              isHasBarIcon
                  ? Padding(
                      padding: const EdgeInsets.only(top: 14, bottom: 14),
                      child: Center(
                        child: Container(
                          width: 54,
                          height: 4,
                          color: const Color(0xff999999),
                        ),
                      ),
                    )
                  : const SizedBox(),
              ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    bottomSheetBody,
                  ]),
            ],
          ),
        );
      });
}
