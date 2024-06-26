import 'package:calma/Data/salon_details_data.dart';
import 'package:calma/Data/salon_expert_data.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/Icon_and_text_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:calma/widgets/stack_img_container.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  //0.. for Image
  //1.. for Text

  // List expertBarberImages = [
  //   "asset/images/aftab.jpg",
  //   "asset/images/yazdan.jpg",
  //   "asset/images/azam.jpg",
  //   "asset/images/shayan.jpg",
  //   "asset/images/zaid.jpg",
  // ];

  List expertBarberName = [
    "Aftab",
    "Yazdan",
    "Azam",
    "Shayan",
    "Zaid",
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    ImagesAndText imagesAndText1 = ImagesAndText();
    SalonExpertDetailData salonExpertDetailData = SalonExpertDetailData();
    return Padding(
      padding:
          // EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10),
          const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          /* ************************** starts Home page main Banner ************************** */
          SizedBox(
            height: screenHeight * 0.218, //Dimensions.height194, //194
            child: PageView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      // EdgeInsets.only(
                      //     left: Dimensions.width5, right: Dimensions.width5),
                      const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight * 0.022),
                    // color: Colors.red,
                    color: const Color(0xff85ABB8),
                    image: const DecorationImage(
                      alignment: Alignment(1.2, 0),
                      fit: BoxFit.contain,
                      image: AssetImage("asset/images/menPicHomePage.png"),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: screenHeight * 0.02245, //20,
                        left: screenWidth * 0.03645, //15,
                        child: const BigText(
                          text: "Noble Circle \nPromo",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.12909, //115,
                        left: screenWidth * 0.03645, //15,
                        child: const BigText(
                          text: "Get 50% off for the \nentire friend circle",
                          fontSize: 18,
                          fontWeightName: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          /* ************************** Ends Home page main Banner ************************** */

          /* ************ Select Cherished Text Starts ***************** */
          ServicesAndExpertText(
            text: "Select Cherished Services",
            onPress: () {
              Navigator.pushNamed(context, '/search-page');
            },
          ),
          /* ************ Select Cherished Text Ends ***************** */

          /* ************* Starts Cherished services with horizontal scroll ************* */
          SizedBox(
            height: screenHeight * 0.17, //151
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: imagesAndText1.imageAndText[0].length,
              // itemCount: serviceImages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                /// Column is used here for showing the images along with services name
                return InkWell(
                  onTap: () {
                    debugPrint(imagesAndText1.imageAndText[1][index].toString());

                    Navigator.pushNamed(context, '/salon-search-page',
                        arguments:
                            imagesAndText1.imageAndText[1][index].toString());
                    // Navigator.pushNamed(context, '/salon-search-page',arguments: imagesAndText1.imageAndText[1][index].toString());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.123, //110,
                        width: screenWidth * 0.275, //113,

                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.012 /*5*/,
                            vertical: screenHeight * 0.011 /*10*/),

                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.007 /*6*/),
                          color: AppColor.imageBgColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imagesAndText1.imageAndText[0]
                                    [index]
                                .toString()),
                            // image: AssetImage(serviceImages[index].toString()),
                          ),
                        ),
                      ),
                      SmallText(
                          text:
                              imagesAndText1.imageAndText[1][index].toString(),
                          // text: imageServiceName[index].toString(),
                          color: AppColor.quoteColor)
                    ],
                  ),
                );
              },
            ),
          ),
          /* ************* Ends Cherished services with horizontal scroll ************* */

          /* ************ Experts around you Text STARTS here ***************** */
          ServicesAndExpertText(
            text: "Experts around you",
            onPress: () {
              Navigator.pushNamed(context, '/expert-view-all');
            },
          ),
          /* ************ Experts around you Text ENDS here ***************** */

          /* ************ Experts around you Image STARTS here ***************** */
          SizedBox(
            height: screenHeight * 0.19083, //170,
            // height: screenHeight * 0.17, //151
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: salonExpertDetailData.expertDetailData.length,
              // itemCount: expertBarberImages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                /// Column is used here for showing the images along with services name
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'salon-expert-detail-page');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.14593, //130
                        width: screenWidth * 0.275, //113,
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.012 /*5*/,
                            vertical: screenHeight * 0.011 /*10*/),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.imageBgColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(salonExpertDetailData.expertDetailData[index].imagePath),
                            // image: AssetImage("${expertBarberImages[index]}"),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: screenHeight * 0.11225, //100,
                                left: screenWidth * 0.0851, //35,
                                child: Container(
                                  height: screenHeight * 0.0336, //30,
                                  width: screenWidth * 0.12153, //50,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff85ABB8),
                                      borderRadius: BorderRadius.circular(
                                          screenHeight * 0.01123 /*10*/)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SmallText(
                                        text: salonExpertDetailData.expertDetailData[index].rating.toString(),
                                        fontSize: screenHeight * 0.01123 /*10*/,
                                        fontWeightName: FontWeight.w600,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: screenHeight * 0.01684 /*15*/,
                                        // size: screenHeight * 0.02245 /*20*/,
                                        color: const Color(0xffFFC107),
                                      )
                                    ],
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                      SmallText(
                        // text: salonExpertDetailData.expertDetailData[index].name,
                          text: expertBarberName[index],
                          // text: "Azam",
                          color: AppColor.quoteColor)
                    ],
                  ),
                );
              },
            ),
          ),
          /* ************ Experts around you Image ENDS here ***************** */

          SizedBox(
            height: screenHeight * 0.0112, //10
          ),

          /* ********************** Starts top salon & Popular Button ************** */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.024 /*10*/),
                child: BigText(
                  text: "Top Salons Around You",
                  fontSize: screenHeight * 0.02, // 18,
                  fontWeightName: FontWeight.bold,
                  color: AppColor.mainBlackColor,
                ),
              ),

              /* ************ Starts Popular Button ************** */
              Container(
                height: screenHeight * 0.027, //24
                width: screenWidth * 0.219, //90
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(screenHeight * 0.009 /*8*/),
                  boxShadow: [
                    BoxShadow(
                        // color: Color(0xffe8e8e8),
                        color: Colors.blueGrey,
                        offset: Offset(0, /*4*/ screenHeight * 0.004)),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(screenWidth * 0.006 /*2.5*/, 0),
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-screenWidth * 0.006 /*2.5*/, 0)),
                  ],
                ),
                child: const IconAndTextButton(
                  text: "Popular",
                  iconData: Icons.swap_vert,
                  textColor: AppColor.iconColor,
                ),
              ),
              /* ************ Starts Popular Button ************** */
            ],
          ),
          /* ********************** Ends Popular Button & top salon ************** */

          /* ************************ Nearest Salon List STARTS here ************************** */
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: SalonDetailsData.salonDetailsData.length,
            padding:
                EdgeInsets.only(top: screenHeight * 0.0168 /*15*/, bottom: 0),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: screenHeight * 0.017 /*15*/),
              child: InkWell(
                onTap: () {
                  Navigator
                      .pushNamed(context, '/main-salon-show-page', arguments: {
                    'salonName':
                        SalonDetailsData.salonDetailsData[index].salonName,
                    'image':
                        SalonDetailsData.salonDetailsData[index].salonImagePath,
                    'location':
                        SalonDetailsData.salonDetailsData[index].salonLocation,
                    'distance': SalonDetailsData
                        .salonDetailsData[index].distance
                        .toString(),
                    'rating': SalonDetailsData.salonDetailsData[index].rating,
                    'fullAddress':
                        SalonDetailsData.salonDetailsData[index].fullAddress,
                  });
                },
                child: ImageContWithStack(
                  text: SalonDetailsData.salonDetailsData[index].salonName,
                  image: AssetImage(
                      SalonDetailsData.salonDetailsData[index].salonImagePath),
                  location:
                      SalonDetailsData.salonDetailsData[index].salonLocation,
                  gender: SalonDetailsData.salonDetailsData[index].genderType,
                  distance: SalonDetailsData.salonDetailsData[index].distance,
                  rating: SalonDetailsData.salonDetailsData[index].rating,
                ),
              ),
            ),
          ),
          /* ************************ Nearest Salon List ENDS here ************************** */
        ],
      ),
    );
  }

  // Widget expertImages(double screenHeight, double screenWidth, int index) {
  //   return Stack(
  //     children: [
  //       Positioned(
  //           top: screenHeight * 0.02245 , //20,
  //           child: Container(
  //             height: screenHeight * 0.123, //110,
  //             width: screenWidth * 0.275, //113,
  //             margin: EdgeInsets.symmetric(
  //                 horizontal: screenWidth * 0.012 /*5*/,
  //                 vertical: screenHeight * 0.011 /*10*/),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: AppColor.imageBgColor,
  //               image: DecorationImage(
  //                 fit: BoxFit.cover,
  //                 image: AssetImage("asset/images/aftab.jpg"),
  //                 // image: AssetImage("${expertBarberImages[index]}"),
  //               ),
  //             ),
  //           ),
  //       ),
  //       Positioned(
  //           top: screenHeight * 0.05612, //50,
  //           child: SmallText(
  //               text: expertBarberName[index],
  //               color: AppColor.quoteColor),
  //       ),
  //     ],
  //   );
  // }
}

class ServicesAndExpertText extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const ServicesAndExpertText(
      {super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigText(
            text: text,
            fontSize: screenHeight * 0.02 /*18*/,
            fontWeightName: FontWeight.bold,
            color: AppColor.mainBlackColor,
          ),
          InkWell(
            onTap: onPress,
            child: const SmallText(
              text: "View All",
              color: AppColor.quoteColor,
            ),
          )
        ],
      ),
    );
  }
}

// Widget servicesExpertText(String text, double screenHeight,  ){

class ImagesAndText {
  //0.. for Image
  //1.. for Text
  final imageAndText = [
    [
      "asset/images/haircut.jpg",
      "asset/images/facial.jpg",
      "asset/images/bridal_makeup.jpg",
      "asset/images/threadingEyebrow.jpg",
      "asset/images/beardTrimming.jpg",
      "asset/images/shaving.jpg",
    ],
    [
      "Haircut",
      "Facial",
      "Bridal Makeup",
      "Threading",
      "Trim & Style",
      "Shaving"
    ]
  ];
}
//   return Padding(
//     padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         BigText(
//           text: text,
//           fontSize: screenHeight * 0.02 /*18*/,
//           fontWeightName: FontWeight.bold,
//           color: AppColor.mainBlackColor,
//         ),
//         InkWell(
//           onTap: (){
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>  const SearchPage()));
//           },
//           child: const SmallText(
//             text: "View All",
//             color: AppColor.quoteColor,
//           ),
//         )
//       ],
//     ),
//   );
// }

// class ImageContWithStack extends StatelessWidget {
//   final AssetImage image;
//   const ImageContWithStack({super.key, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           child: Container(
//             height: 180,
//             width: 370,
//             decoration: BoxDecoration(
//               color: Colors.pinkAccent,
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(20),
//                 topLeft: Radius.circular(20),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: image,
//                 // image: AssetImage("asset/images/salonImage.jpg"),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 110,
//             child: Container(
//               height: 70,
//               width: 370,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   topLeft: Radius.circular(20),
//                 ),
//                 color:AppColor.statusBookServiceColor,
//               ),
//         ),
//         ),
//
//         const Positioned(
//           left: 14,
//             top: 110,
//             child: IconColumn()),
//       ],
//     );
//   }
// }
