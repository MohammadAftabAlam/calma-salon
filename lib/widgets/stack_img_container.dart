import 'package:calma/utils/colors.dart';
import 'package:flutter/material.dart';

import 'Icon_and_text_button.dart';
import 'big_text.dart';
import 'small_text.dart';

class ImageContWithStack extends StatelessWidget {
  final AssetImage image;
  const ImageContWithStack({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Container(
          height: screenHeight * 0.202 /*180,*/,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColor.imageBgColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenHeight * 0.022 /*20*/),
              topLeft: Radius.circular(screenHeight * 0.022 /*20*/),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: image,
              // image: AssetImage("asset/images/salonImage.jpg"),
            ),
          ),
        ),

        Positioned(
          top: screenHeight * 0.125 /*110*/,
          child: Container(
            height: screenHeight * 0.079 /*70*/,
            width: screenWidth * 0.953 /*370*/,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(screenHeight * 0.022 /*20*/),
                topLeft: Radius.circular(screenHeight * 0.022 /*20*/),
              ),
              // color:Colors.red,
              color: AppColor.statusBookServiceColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036 /*15*/,
                  top: screenHeight * 0.006 /*5*/,
              ),
              child: IconColumn(screenWidth: screenWidth, screenHeight: screenHeight,),
            ),
          ),
        ),

        // Positioned(
        //     left: Dimensions.width14,
        //     top: Dimensions.height110,
        //     child: const IconColumn(),
        //     ),
      ],
    );
  }
}

class IconColumn extends StatelessWidget {
  final double screenHeight, screenWidth;
  const IconColumn({super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "Varsha Salon",
              fontWeightName: FontWeight.w600,
              color: AppColor.mainBlackColor,
              fontSize: screenHeight * 0.02 /*18*/,
            ),
            Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  size: screenHeight * 0.022 /*20*/,
                ),
                const SizedBox(
                  width: 2,
                ),
                SmallText(
                  text: "Male",
                  color: AppColor.mainBlackColor,
                  fontSize: screenHeight * 0.013 /*12*/,
                  fontWeightName: FontWeight.w400,
                ),
              ],
            ),
            SmallText(
              text: "New Friends Colony",
              color: AppColor.mainBlackColor,
              fontSize: screenHeight * 0.013 /*12*/,
              fontWeightName: FontWeight.w400,
            ),
          ],
        ),
        SizedBox(
          width: screenWidth * 0.049, //20,
        ),
        Row(
          children: [
            IconColumnButton(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              text: "4.0",
              iconData: Icons.star,
              color: const Color(0xffFFC107),
            ),
            IconColumnButton(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                text: "1.3km", iconData: Icons.location_on_outlined,
            ),
            Padding(padding: EdgeInsets.only(left: screenWidth * 0.0122 /*5*/)),
          ],
        )
      ],
    );
  }
}

class IconColumnButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  final double screenHeight,screenWidth;
  const IconColumnButton(
      {super.key,
        required this.screenHeight,
        required this.screenWidth,
      required this.text,
      required this.iconData,
      this.color = AppColor.mainBlackColor

      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.039 /*35*/,
      width: screenWidth * 0.207 /*85*/,
      margin: EdgeInsets.only(
          left: screenWidth * 0.024 /*10*/,
          top: screenHeight * 0.022 /*20*/,
      ),
      padding: EdgeInsets.only(left: screenWidth * 0.012 /*5*/),
      decoration: BoxDecoration(
          color: AppColor.statusButtonColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(screenHeight * 0.022 /*20*/),
      ),
      child: IconAndTextButton(
        text: text,
        iconData: iconData,
        iconColor: color,
      ),
    );
  }
}
