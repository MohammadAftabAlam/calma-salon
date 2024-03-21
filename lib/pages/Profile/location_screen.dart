import 'package:calma/pages/Profile/account_info.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class ShowLocationPage extends StatefulWidget {
  const ShowLocationPage({super.key});

  @override
  State<ShowLocationPage> createState() => _ShowLocationPage();
}

class _ShowLocationPage extends State<ShowLocationPage> {
  int itemCount =1;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(
            // positionedTop: 25,
              onPress: () {Navigator.pop(context);}),
          /* ********************************** Title of Page STARTS here ***************************** */
          Positioned(
            top: screenHeight * 0.0634,
            left: screenWidth * 0.3497,
            child: const TitleText(text: "Location"),
          ),
          /* ********************************** Title of Page STARTS here ***************************** */

          /* ********************************** Divider STARTS here ***************************** */
          Positioned(
              top: screenHeight * 0.111,
              left: screenWidth * 0.0049,
              right: screenWidth * 0.0049,
              child: const Divider(
                thickness: 1.2,
                color: Color(0xffD3CECD),
              )),
          /* ********************************** Divider ENDS here ***************************** */

          /* ********************************** Button to add another location STARTS here ***************************** */
          Positioned(
            top: screenHeight * 0.134,
            // top: screenHeight * 0.168,
            left: screenWidth * 0.0486,
            right: screenWidth * 0.0486,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: screenHeight * 0.0606,
                width: screenWidth * 0.9406,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenHeight * 0.0168),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0731),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Iconsax.location_add,
                            color: AppColor.iconColor,
                          ),
                          SizedBox(
                            width: screenWidth * 0.0366,
                          ),
                          BigText(
                            text: "Add Address",
                            fontSize: screenHeight * 0.0224,
                            fontFamilyName: "Raleway",
                            fontWeightName: FontWeight.w600,
                            color: AppColor.textColor2,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.iconColor,
                        size: screenHeight * 0.0301,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          /* ********************************** Button to add another location ENDS here ***************************** */

          /* ********************************** My Address Text STARTS here ***************************** */
          Positioned(
            top: screenHeight * 0.2131,
            // top: screenHeight * 0.2391,
            left: screenWidth * 0.0486,
            child: const BigText(
              text: "My Addresses",
              color: Color(0xff374151),
              fontFamilyName: "Inter",
              fontWeightName: FontWeight.w600,
            ),
          ),
          /* ********************************** My Address Text ENDS here ***************************** */


          /* ********************************** Container to see added Location STARTS here ***************************** */
          Positioned(
              // top: screenHeight * 0.2789,
              top: screenHeight * 0.2589,
              left: screenWidth * 0.0486,
              right: screenWidth * 0.0486,
              child: SizedBox(
                height: screenHeight * 0.7301,
                child: ListView.builder(
                    itemCount: itemCount,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.0056 /*5*/),
                        child: Container(
                          height: screenHeight * 0.1258,
                          width: screenWidth * 0.9406,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(screenHeight * 0.009 /*8*/),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.0486, top: screenHeight * 0.0224),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset("asset/icons/home-icon.svg",),
                                SizedBox(
                                  width: screenWidth * 0.063,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(text: "Home", fontSize: screenHeight * 0.0224,),
                                    const SmallText(
                                      text:
                                      "E-11, 4th Flor,Muradi Road, Batla House,\n Jamia nagar,New Delhi - 110025 ",
                                      textAlignName: TextAlign.justify,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
          ),
          /* ********************************** Container to see added Location ENDS here ***************************** */

        ],
      ),
    );
  }
}




// import 'package:calma/pages/Profile/account_info.dart';
// import 'package:calma/utils/back_arrow_but_with_positioned.dart';
// import 'package:calma/utils/colors.dart';
// import 'package:calma/widgets/big_text.dart';
// import 'package:calma/widgets/small_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:iconsax/iconsax.dart';
//
// class ShowLocationPage extends StatefulWidget {
//   const ShowLocationPage({super.key});
//
//   State<ShowLocationPage> createState() => _ShowLocationPage();
// }
//
// class _ShowLocationPage extends State<ShowLocationPage> {
//   int itemCount =1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.mainBackgroundColor,
//       body: Stack(
//         children: [
//           BackArrowButtonWithPositioned(onPress: () {Navigator.pop(context);}),
//           /* ********************************** Title of Page STARTS here ***************************** */
//            Positioned(
//             top: 60,
//             left: 144,
//             child: TitleText(text: "Location"),
//           ),
//           /* ********************************** Title of Page STARTS here ***************************** */
//
//           /* ********************************** Divider STARTS here ***************************** */
//           Positioned(
//               top: 100,
//               left: 2,
//               right: 2,
//               child: Divider(
//                 thickness: 1,
//                 color: Color(0xffD3CECD),
//               )),
//           /* ********************************** Divider ENDS here ***************************** */
//
//           /* ********************************** Button to add another location STARTS here ***************************** */
//           Positioned(
//             top: 120,
//             left: 20,
//             right: 20,
//             child: InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 54,
//                 width: 387,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         // mainAxisAlignment: ,
//                         children: [
//                           Icon(
//                             Iconsax.location_add,
//                             color: AppColor.iconColor,
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           BigText(
//                             text: "Add Address",
//                             fontSize: 20,
//                             fontFamilyName: "Raleway",
//                             fontWeightName: FontWeight.w600,
//                             color: AppColor.textColor2,
//                           ),
//                         ],
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         color: AppColor.iconColor,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           /* ********************************** Button to add another location ENDS here ***************************** */
//
//           /* ********************************** My Address Text STARTS here ***************************** */
//           Positioned(
//             top: 190,
//             left: 20,
//             child: BigText(
//               text: "My Addresses",
//               color: Color(0xff374151),
//               fontFamilyName: "Inter",
//               fontWeightName: FontWeight.w600,
//             ),
//           ),
//           /* ********************************** My Address Text ENDS here ***************************** */
//
//
//           /* ********************************** Container to see added Location STARTS here ***************************** */
//           Positioned(
//               top: 230,
//               left: 20,
//               right: 20,
//               child: SizedBox(
//                 height: 650,
//                 child: ListView.builder(
//                   itemCount: itemCount,
//                     padding: EdgeInsets.only(top: 0),
//                     itemBuilder: (context,index){
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 5),
//                     child: Container(
//                       height: 112,
//                       width: 387,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20, top: 20),
//                         child: Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SvgPicture.asset("asset/icons/home-icon.svg"),
//                             SizedBox(
//                               width: 26,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 BigText(text: "Home"),
//                                 SmallText(
//                                   text:
//                                   "E-11, 4th Flor,Muradi Road, Batla House,\n Jamia nagar,New Delhi - 110025 ",
//                                   textAlignName: TextAlign.justify,
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               )
//           ),
//           /* ********************************** Container to see added Location ENDS here ***************************** */
//
//         ],
//       ),
//     );
//   }
// }