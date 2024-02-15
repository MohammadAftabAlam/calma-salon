import 'package:calma/utils/colors.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text, fontFamilyName;
  final FontStyle fontStyleName;
  final FontWeight fontWeightName;
  final TextAlign textAlignName;
  final Color color;
  final double fontSize;
  const SmallText(
      {super.key,
      required this.text,
      this.fontFamilyName = "Poppins",
      this.fontStyleName = FontStyle.normal,
      this.fontWeightName = FontWeight.w400,
      this.textAlignName = TextAlign.start,
      this.color = AppColor.mainBlackColor,
        this.fontSize = 14,
      });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Text(
      text,
      textAlign: textAlignName,
      style: TextStyle(
        color: color,
        fontSize: screenHeight * fontSize/890.286,  // == 14 ? screenHeight * 0.016: fontSize,
        fontFamily: fontFamilyName,
        fontStyle: fontStyleName,
        fontWeight: fontWeightName,
      ),
    );
  }
}
