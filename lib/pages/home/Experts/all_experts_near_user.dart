import 'package:calma/Data/salon_expert_data.dart';
import 'package:calma/pages/home/salon_search.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class AllExpertsNearUser extends StatefulWidget {
  const AllExpertsNearUser({super.key});

  @override
  State<AllExpertsNearUser> createState() => _AllExpertsNearUserState();
}


class _AllExpertsNearUserState extends State<AllExpertsNearUser> {
  bool isSelected = false;
  bool isSortSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    SalonExpertDetailData salonExpertDetailData = SalonExpertDetailData();
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* *************************** Back Arrow Button STARTS here ************************* */
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.0365, top: screenHeight * 0.0561),
            child: BackArrowButton(onPress: () {
              Navigator.pop(context);
            }),
          ),
          /* *************************** Back Arrow Button ENDS here ************************* */

          SizedBox(
            height: screenHeight * 0.0225,
          ),
          /* *************************** Nearest, Popular & Sort Button STARTS here ************************* */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonSalonSearch(
                text: "Nearest",
                isSelected: isSelected,
              ),
              ButtonSalonSearch(text: "Popular", isSelected: isSelected),
              Container(
                height: screenHeight * 0.0471,
                width: screenWidth * 0.2431,
                decoration: BoxDecoration(
                  color: isSortSelected
                      ? AppColor.buttonBackgroundColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(screenHeight * 0.0112),
                  border: Border.all(color: AppColor.buttonBackgroundColor),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.0122),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        isSortSelected = !isSortSelected;
                      });
                    },
                    icon: SvgPicture.asset(
                      "asset/icons/sortIcon.svg",
                      height: screenHeight * 0.0168,
                      colorFilter: ColorFilter.mode(isSortSelected ? Colors.white : Colors.black, BlendMode.srcIn),
                    ),
                    label: SmallText(
                      text: "Sort",
                      fontWeightName: FontWeight.w600,
                      color: isSortSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          /* *************************** Nearest, Popular & Sort Button ENDS here ************************* */

          SizedBox(
            height: screenHeight * 0.0095,
          ),

          /* *************************** List for Experts STARTS here ************************* */
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: screenHeight * 0.0034 /*3*/),
                itemCount: salonExpertDetailData.expertDetailData.length,
                itemBuilder: (context, index) {
                  return Card(
                    /* *************************** Border of card STARTS here ************************* */
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xff8D8D8D)),
                          borderRadius: BorderRadius.circular(screenHeight * 0.0112),
                      ),
                    /* *************************** Border of card ENDS here ************************* */

                      margin: EdgeInsets.all(screenHeight * 0.0112),

                    /* *************************** Image and details of expert STARTS here ************************* */
                      child: Row(
                        children: [
                          /* *************************** Image of expert STARTS here ************************* */
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.0316, top: screenHeight * 0.0168, bottom: screenHeight * 0.0168),
                            child: Container(
                              height: screenHeight * 0.1584,
                              width: screenWidth * 0.2891,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(screenHeight * 0.0112),
                                image: DecorationImage(
                                  image: AssetImage(salonExpertDetailData.expertDetailData[index].imagePath),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          /* *************************** Image of expert ENDS here ************************* */

                          SizedBox(
                            width: screenWidth * 0.6073,
                            child: Padding(
                              padding: EdgeInsets.only(left: screenWidth * 0.0486, top: screenHeight * 0.0258),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /* *************************** Name of expert STARTS here ************************* */
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                          text: salonExpertDetailData.expertDetailData[index].name),
                                      const Icon(Iconsax.heart),
                                    ],
                                  ),
                                  /* *************************** Name of expert ENDS here ************************* */

                                  Divider(
                                    height: screenHeight * 0.0112,
                                    thickness: 1,
                                    endIndent: screenWidth * 0.0122,
                                    color: const Color(0xffC7C2C2),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.0225,
                                    width: screenWidth * 0.85,

                                    /* *************************** Services provided by expert STARTS here ************************* */
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: salonExpertDetailData.expertDetailData[index].expertise.length,
                                        itemBuilder: (context, serviceIndex) {
                                          return SmallText(
                                              text: salonExpertDetailData.expertDetailData[index].expertise[serviceIndex],
                                              fontFamilyName: "Inter",
                                              fontWeightName: FontWeight.w700,
                                              color: const Color(0xff5F6368),
                                          );
                                        }),
                                  ),
                                  /* *************************** Services provided by expert ENDS here ************************* */

                                  SizedBox(
                                    height: screenHeight * 0.0056,
                                  ),

                                  /* *************************** Expert salon details STARTS here ************************* */
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: AppColor.iconColor,
                                      ),
                                      SmallText(
                                          text: salonExpertDetailData.expertDetailData[index].workingInSalon),
                                    ],
                                  ),
                                  /* *************************** Expert salon details ENDS here ************************* */

                                  SizedBox(
                                    height: screenHeight * 0.0056,
                                  ),

                                  /* *************************** Expert year of experience and rating details STARTS here ************************* */
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "asset/icons/experience-icon.svg",
                                        height: screenHeight * 0.0202,
                                        width: screenWidth * 0.0364,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.0122,
                                      ),
                                      SmallText(
                                          text: "${salonExpertDetailData.expertDetailData[index].yearOfExperience}+ Years |"),
                                      SizedBox(
                                        width: screenWidth * 0.0122,
                                      ),
                                      SvgPicture.asset(
                                        "asset/icons/star.svg",
                                        colorFilter: const ColorFilter.mode(Color(0xffFEB052), BlendMode.srcIn),
                                        height: screenHeight * 0.0202,
                                        width: screenWidth * 0.0364,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.0122,
                                      ),
                                      SmallText(
                                          text: salonExpertDetailData.expertDetailData[index].rating.toString())
                                    ],
                                  ),
                                  /* *************************** Expert year of experience and rating details ENDS here ************************* */

                                  /* *************************** Book now Button STARTS here ************************* */
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'salon-expert-detail-page');
                                      },
                                      iconAlignment : IconAlignment.end,
                                      icon: SvgPicture.asset("asset/icons/forward_arrow_square.svg"),
                                      label: const SmallText(
                                        text: "Book Now",
                                        fontWeightName: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  /* *************************** Book now Button ENDS here ************************* */

                                  SizedBox(
                                    height: screenHeight * 0.0056,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    /* *************************** Image and details of expert ENDS here ************************* */
                  );
                }),
          )
          /* *************************** List for Experts ENDS here ************************* */

        ],
      ),
    );
  }
  // expertServiceText(String serviceName) {
  //   return SmallText(
  //     text: serviceName,
  //     fontFamilyName: "Inter",
  //     fontWeightName: FontWeight.w700,
  //     color: const Color(0xff5F6368),
  //   );
  // }
}

// class _AllExpertsNearUserState extends State<AllExpertsNearUser> {
//   bool isSelected = false;
//   bool isSortSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     SalonExpertDetailData salonExpertDetailData = SalonExpertDetailData();
//     return Scaffold(
//       backgroundColor: AppColor.mainBackgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15, top: 50),
//             child: BackArrowButton(onPress: () {
//               Navigator.pop(context);
//             }),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ButtonSalonSearch(
//                 text: "Nearest",
//                 isSelected: isSelected,
//               ),
//               ButtonSalonSearch(text: "Popular", isSelected: isSelected),
//               Container(
//                 height: screenHeight * 0.0471, //42,
//                 width: screenWidth * 0.2431, //screenHeight * 0.01123/*10*/0,
//                 decoration: BoxDecoration(
//                   color: isSortSelected
//                       ? AppColor.buttonBackgroundColor
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(screenHeight * 0.0112),
//                   border: Border.all(color: AppColor.buttonBackgroundColor),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.0122 /*5*/),
//                   child: TextButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         isSortSelected = !isSortSelected;
//                       });
//                     },
//                     icon: SvgPicture.asset(
//                       "asset/icons/sortIcon.svg",
//                       height: screenHeight * 0.0168, //15,
//                       color: isSortSelected ? Colors.white : Colors.black,
//                     ),
//                     label: SmallText(
//                       text: "Sort",
//                       fontWeightName: FontWeight.w600,
//                       color: isSortSelected ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: salonExpertDetailData.expertDetailData.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                       shape: RoundedRectangleBorder(
//                           side: const BorderSide(color: Color(0xff8D8D8D)),
//                           borderRadius: BorderRadius.circular(12)),
//                       margin: EdgeInsets.all(screenHeight * 0.01123/*10*/),
//                       child: Row(
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 13, top: 15, bottom: 15),
//                             child: Container(
//                               height: 141,
//                               width: 119,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(screenHeight * 0.01123/*10*/),
//                                 image: DecorationImage(
//                                   image: AssetImage(salonExpertDetailData
//                                       .expertDetailData[index].imagePath),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 250,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 20, top: 23),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       BigText(
//                                           text: salonExpertDetailData
//                                               .expertDetailData[index].name),
//                                       const Icon(Iconsax.heart),
//                                     ],
//                                   ),
//                                   Divider(
//                                     height: screenHeight * 0.01123/*10*/,
//                                     thickness: 1,
//                                     endIndent: 5,
//                                     // indent: 5,
//                                     color: Color(0xffC7C2C2),
//                                     // color: Colors.red,
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                     width: 350,
//                                     child: ListView.builder(
//                                         scrollDirection: Axis.horizontal,
//                                         itemCount: salonExpertDetailData
//                                             .expertDetailData[index]
//                                             .expertise
//                                             .length,
//                                         itemBuilder: (context, pageIndex) {
//                                           return expertServiceText(
//                                               salonExpertDetailData
//                                                   .expertDetailData[index]
//                                                   .expertise[pageIndex]);
//                                         }),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       // SvgPicture.asset("asset/icons/location.svg",),
//                                       Icon(
//                                         Icons.location_on_outlined,
//                                         color: AppColor.iconColor,
//                                       ),
//                                       SmallText(
//                                           text: salonExpertDetailData
//                                               .expertDetailData[index]
//                                               .salonLocation),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         "asset/icons/experience-icon.svg",
//                                         height: 18,
//                                         width: 15,
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       SmallText(
//                                           text:
//                                               "${salonExpertDetailData.expertDetailData[index].yearOfExperience}+ Years |"),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       SvgPicture.asset(
//                                         "asset/icons/star.svg",
//                                         color: Color(0xffFEB052),
//                                         height: 18,
//                                         width: 15,
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       SmallText(
//                                           text: salonExpertDetailData
//                                               .expertDetailData[index].rating
//                                               .toString())
//                                     ],
//                                   ),
//                                   Align(
//                                     alignment: Alignment.bottomRight,
//
//                                     // child: ElevatedButton(onPressed: (){}, child: SizedBox(
//                                     //   width: screenHeight * 0.01123/*10*/0,
//                                     //   child: Row(children: [SmallText(text: "Book Now",fontWeightName: FontWeight.w700),
//                                     //
//                                     //   SvgPicture.asset("asset/icons/forward_arrow_square.svg")
//                                     //   ],),
//                                     // ),
//                                     // //SmallText(text: "Book Now",fontWeightName: FontWeight.w700,)
//                                     // ),
//                                     child: OutlinedButton.icon(
//                                       onPressed: () {
//                                         Navigator.pushNamed(context,
//                                             'salon-expert-detail-page');
//                                       },
//                                       icon: SvgPicture.asset(
//                                           "asset/icons/forward_arrow_square.svg"),
//                                       label: SmallText(
//                                         text: "Book Now",
//                                         fontWeightName: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ));
//                 }),
//           )
//         ],
//       ),
//     );
//   }
//   expertServiceText(String serviceName) {
//     return SmallText(
//       text: serviceName,
//       fontFamilyName: "Inter",
//       fontWeightName: FontWeight.w700,
//       color: const Color(0xff5F6368),
//     );
//   }
// }
