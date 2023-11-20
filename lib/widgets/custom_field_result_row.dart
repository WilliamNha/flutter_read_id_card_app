import 'package:flutter/material.dart';

class CustomFieldResultRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  final double topPadding;
  final bool isTextBold;
  const CustomFieldResultRow({
    required this.leftText,
    required this.rightText,
    this.topPadding = 10,
    this.isTextBold = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  leftText,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight:
                        isTextBold ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    rightText,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight:
                            isTextBold ? FontWeight.bold : FontWeight.normal),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 0.5,
            color: Colors.black26,
          )
        ],
      ),
    );
  }
}
