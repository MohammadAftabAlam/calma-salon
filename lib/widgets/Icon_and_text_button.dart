import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextButton extends StatelessWidget {
  final IconData iconData;
  final double spaceBetween;
  final Color iconColor;
  final Color textColor;
  final String text;
  final double iconSize;
  final FontWeight fontWeight;
  // final DateTime dateTime;

  const IconAndTextButton(
      {super.key,
      required this.text,
      required this.iconData,
      this.iconColor = Colors.black,
      this.spaceBetween = 5,
      this.iconSize = 24,
      this.textColor = AppColor.mainBlackColor,
      this.fontWeight = FontWeight.w400
      // this.dateTime,
      });

  // String date ;
  // String time = DateTime.parse(dateTime).toString();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        Icon(
          iconData,
          size: iconSize == 24 ? screenHeight * 0.027 /*24*/ : iconSize,
          color: iconColor,
        ),
        Padding(
          padding: EdgeInsets.only(left: spaceBetween),
          child: SmallText(
            text: text,
            color: textColor,
            fontWeightName: fontWeight,
          ),
        ),
      ],
    );
  }
}
