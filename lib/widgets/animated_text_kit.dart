import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calma/utils/colors.dart';
import 'package:flutter/material.dart';

class AnimatedTextAftab extends StatelessWidget {
  final String text;
  final Color color;
  const AnimatedTextAftab({super.key, required this.text, this.color = AppColor.animatedTextColor});

  @override
  Widget build(BuildContext context) {
    return  AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textStyle: const TextStyle(
            // color: color,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 90),
        ),
        TypewriterAnimatedText("facial",textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: Color(0xff8BBCC4),),  speed: const Duration(milliseconds: 90),),
        TypewriterAnimatedText("Make Up",textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: Color(0xff8BBCC4),), speed: const Duration(milliseconds: 90),),
        TypewriterAnimatedText("& more",textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: Color(0xff8BBCC4),), speed: Duration(milliseconds: 90)),
      ],

      repeatForever: true,
      // totalRepeatCount: 4,
      pause: const Duration(milliseconds: 500),
      displayFullTextOnTap: true,
      stopPauseOnTap: false,
    );
  }
}
