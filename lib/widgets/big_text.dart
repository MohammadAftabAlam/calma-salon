import 'package:calma/utils/colors.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text, fontFamilyName;
  final FontStyle fontStyleName;
  final FontWeight fontWeightName;
  final TextAlign textAlignName;
  final Color color;
  final double fontSize;
  const BigText(
      {super.key,
        required this.text,
        this.fontFamilyName = "Poppins",
        this.fontStyleName = FontStyle.normal,
        this.fontWeightName = FontWeight.bold,
        this.textAlignName = TextAlign.start,
        this.color = AppColor.textColor,
        this.fontSize = 20,
      });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Text(
      text,
      textAlign: textAlignName,
      style: TextStyle(
        color: color,
        fontSize: fontSize == 20 ? screenHeight *0.022 : fontSize,
        fontFamily: fontFamilyName,
        fontStyle: fontStyleName,
        fontWeight: fontWeightName,
      ),
    );
  }
}
