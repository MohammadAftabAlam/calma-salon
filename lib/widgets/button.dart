import 'package:calma/utils/colors.dart';
import 'package:calma/utils/dimensions.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color textColor, buttonColor;
  final double width;
  final double height;
  const Button({
    super.key,
    required this.onPress,
    required this.text,
    this.textColor = Colors.white,
    this.buttonColor = AppColor.buttonBackgroundColor,
    this.width = 147,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: height == 44 ? screenHeight * 0.0494 /*44*/ : screenHeight * height/screenHeight ,
          width: width == 147
              ? screenWidth * 0.3573
              : screenWidth * width / screenWidth, //147,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(screenHeight * 0.0561 /*50*/),
          ),
          child: Center(
            child: SmallText(
              text: text,
              color: textColor,
              fontWeightName: FontWeight.w700,
              fontFamilyName: "Inter",
            ),
          ),
        ),
      ),
    );
  }
}


// class Button extends StatelessWidget {
//   final VoidCallback onPress;
//   final String text,fontFamily;
//   final double height,fontSize,width,radius;
//   final Color color,textColor;
//   // final
//
//   const Button({super.key,
//     required this.onPress,
//     required this.text,
//     this.height = 50,
//     this.width = 345,
//     this.color = AppColor.buttonBackgroundColor,
//     this.fontSize =32,
//     this.textColor = Colors.white,
//     this.fontFamily ="Poppins",
//     this.radius = 8
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.sizeOf(context).height;
//     final screenWidth = MediaQuery.sizeOf(context).width;
//
//     return InkWell(
//       onTap: onPress,
//       child: Container(
//         height:  height == 50 ? screenHeight * 0.0561 : screenHeight * height/screenHeight,
//         width: width == 345 ? screenWidth * 0.8385 : screenWidth * width /screenWidth,
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(radius == 8 ? screenHeight * 0.009: screenHeight*radius/screenHeight),
//         ),
//         child: Center(
//           child: BigText(
//             textAlignName: TextAlign.center,
//             text: text,
//             color: textColor,
//             fontWeightName: FontWeight.bold,
//             fontSize: fontSize == 32 ? screenHeight * 0.0359: screenHeight * fontSize /screenHeight,
//             fontFamilyName: fontFamily,
//           ),
//         ),
//       ),
//     );
//   }
// }

/*ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttonBackgroundColor,
        ),
        child: const SmallText(
          text: "Get OTP",
          color: Colors.white,
          fontWeightName: FontWeight.bold,
          fontSize: 32,
        ),
      ),
*/
