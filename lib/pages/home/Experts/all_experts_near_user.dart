import 'dart:ffi';

import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllExpertsNearUser extends StatefulWidget {
  const AllExpertsNearUser({super.key});

  @override
  State<AllExpertsNearUser> createState() => _AllExpertsNearUserState();
}

class _AllExpertsNearUserState extends State<AllExpertsNearUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 50),
            child: BackArrowButton(onPress: () {
              Navigator.pop(context);
            }),
          ),
          Card(
            // color: AppColor.,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13, top: 15, bottom: 15),
                  child: Container(
                    height: 141,
                    width: 119,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("asset/images/azam.jpg"),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Mohd. Azam Khan"),
                        Divider(
                          height: 20,
                          thickness: 1,
                          endIndent: 5,
                          // indent: 5,
                          color: Colors.red,
                        ),
                        Row(
                          children: [
                            expertServiceText("Haircut,"),
                            SizedBox(
                              width: 5,
                            ),
                            expertServiceText("Facial,"),
                            SizedBox(
                              width: 5,
                            ),
                            expertServiceText("   +3 more")
                          ],
                        ),
                        Row(
                          children: [
                            // SvgPicture.asset("asset/icons/location.svg",),
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColor.iconColor,
                            ),
                            SmallText(text: "Varsha Salon, NFC"),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "asset/icons/experience-icon.svg",
                              height: 18,
                              width: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SmallText(text: "3+ Years |"),
                            SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              "asset/icons/star.svg",
                              height: 18,
                              width: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SmallText(text: "4.8")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  expertServiceText(String serviceName) {
    return SmallText(
      text: serviceName,
      fontFamilyName: "Inter",
      fontWeightName: FontWeight.w700,
      color: const Color(0xff5F6368),
    );
  }

}
