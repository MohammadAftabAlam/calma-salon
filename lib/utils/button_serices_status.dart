import 'colors.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ButtonServiceStatus extends StatelessWidget {
  final VoidCallback onPress;
  final double height;
  final double radius;
  final Color color;
  final IconData iconData;
  final String text;
  final double fontSize;
  final Color iconColor;
  const ButtonServiceStatus({super.key,
    required this.height,
    required this.onPress,
    required this.text,
    required this.iconData,
    this.fontSize = 16,
    this.color = const Color(0xffCBC5E9),
    this.iconColor = AppColor.iconColor,
    this.radius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        // width,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
            borderRadius: BorderRadius.circular(radius)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(iconData,
              color: iconColor,),
              SizedBox(width: 5,),
              SmallText(text: text,fontSize: fontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
