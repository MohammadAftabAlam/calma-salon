import 'package:calma/provider/nearest_salon_provider.dart';
import 'package:calma/widgets/salon_detail_card_trait.dart';
import 'package:calma/Data/services_data.dart';
import 'package:calma/Model/salon_expert.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/Icon_and_text_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/services_trait.dart';
import 'package:calma/widgets/small_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageBody extends ConsumerStatefulWidget {
  const HomePageBody({super.key});

  @override
  ConsumerState<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends ConsumerState<HomePageBody> {
  // List<SalonDetails> nearestSalonList = [];
  List<SalonExperts> nearestSalonsExpert = [];

  @override
  void initState() {
    // getNearestSalon();
    // nearestSalonList =  ref.watch(nearestSalonProvider);
    // getNearestSalonsExpert();
    super.initState();
  }

  @override
  void dispose() {
    // getNearestSalon();
    // getNearestSalonsExpert();
    super.dispose();
  }

  /// Function to find the nearest salon
  // getNearestSalon() {
  //   nearestSalonList =
  //       SalonDetailsData.salonDetailsData.where((salonItemDistance) {
  //     if (salonItemDistance.distance <= 5) {
  //       return true;
  //     }
  //     return false;
  //   }).toList();
  // }

  /// Function to find high rated experts
  // getNearestSalonsExpert() {
  //   // nearestSalonList = ref.watch(nearestSalonProvider);
  //   nearestSalonsExpert = nearestSalonList
  //       .map((salon) {
  //         List<SalonExperts> sortedExpertList =
  //             List<SalonExperts>.from(salon.salonExperts);
  //
  //         sortedExpertList.sort((a, b) => b.rating.compareTo(a.rating));
  //         return sortedExpertList;
  //       })
  //       .expand((experts) => experts)
  //       .toList();
  //
  //   print(nearestSalonsExpert);
  //   print(nearestSalonList);
  //   nearestSalonsExpert.sort((a, b) => b.rating.compareTo(a.rating));
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final nearestSalonList = ref.watch(nearestSalonProvider);

    /// Filtering Nearest Expert
    nearestSalonsExpert = nearestSalonList
        .map((salon) {
          List<SalonExperts> sortedExpertList =
              List<SalonExperts>.from(salon.salonExperts);

          sortedExpertList.sort((a, b) => b.rating.compareTo(a.rating));
          return sortedExpertList;
        })
        .expand((experts) => experts)
        .toList();
    nearestSalonsExpert.sort((a, b) => b.rating.compareTo(a.rating));

    Widget mainContent = Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0243 /*10*/),
      child: Column(
        children: [
          /* ************************** starts Home page main Banner ************************** */
          SizedBox(
            height: screenHeight * 0.218, //194
            child: PageView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight * 0.022),
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

          /* ************ Text Services for WOMEN Text Starts Here ***************** */
          ServicesAndExpertText(
            text: "Services for Women",
            onPress: () {
              Navigator.pushNamed(context, '/search-page');
            },
          ),
          /* ************ Text Services for WOMEN Ends Here ***************** */

          /* ************* Services for WOMEN STARTS here ************* */
          ListServices(servicesList: womenServicesData),

          /* ************* Services for WOMEN ENDS here ************* */

          /* ************ Services for Men Text Starts ***************** */
          ServicesAndExpertText(
            text: "Services for Men",
            onPress: () {
              Navigator.pushNamed(context, '/search-page');
            },
          ),
          /* ************ Services for Men Text Ends ***************** */

          /* ************* Starts services for Men  ************* */
          ListServices(servicesList: menServicesData),
          /* ************* Ends services for Men ************* */

          /* ************ Experts around you Text STARTS here ***************** */
          ServicesAndExpertText(
            text: "Experts around you",
            onPress: () {
              Navigator.pushNamed(context, '/expert-view-all');
            },
          ),
          /* ************ Experts around you Text ENDS here ***************** */

          /* ************ Experts Details STARTS here ***************** */
          SizedBox(
            // height: screenHeight * 0.19083, //170,
            height: 140,
            // height: screenHeight * 0.17, //151
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: nearestSalonsExpert.length,
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
                        height: screenHeight * 0.1067, //95
                        width: screenWidth * 0.207, //85,

                        margin: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.imageBgColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                nearestSalonsExpert[index].imagePath),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: screenHeight * 0.07801, //65,
                              left: screenWidth * 0.0496, //20,
                              // top: 65,
                              //   left: 20,
                              child: Container(
                                // height: screenHeight * 0.0336, //30,
                                height: 25,
                                width: screenWidth * 0.12153, //50,
                                decoration: BoxDecoration(
                                    color: const Color(0xff85ABB8),
                                    borderRadius: BorderRadius.circular(
                                        screenHeight * 0.01123 /*10*/)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text: nearestSalonsExpert[index]
                                          .rating
                                          .toString(),
                                      fontSize: screenHeight * 0.01123 /*10*/,
                                      fontWeightName: FontWeight.w600,
                                    ),
                                    const SizedBox(
                                      width: 3,
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
                        text: nearestSalonsExpert[index].name,
                        fontSize: 12,
                        color: AppColor.quoteColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          /* ************ Experts Details ENDS here ***************** */

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
            itemCount: nearestSalonList.length,
            padding: EdgeInsets.only(top: screenHeight * 0.0168 /*15*/),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/main-salon-show-page',
                        arguments: {
                          'salonName': nearestSalonList[index].salonName,
                          'image': nearestSalonList[index].salonImagePath,
                          'location': nearestSalonList[index].salonLocation,
                          'distance': nearestSalonList[index].distance,
                          'rating': nearestSalonList[index].rating,
                          'fullAddress': nearestSalonList[index].fullAddress,
                        });
                  },
                  overlayColor: WidgetStateProperty.resolveWith((states) {
                    return Colors.transparent;
                  }),
                  child: SalonDetailCardTrait(
                      salonDetail: nearestSalonList[index]));
            },
          ),
          /* ************************ Nearest Salon List ENDS here ************************** */
        ],
      ),
    );

    // Widget alternateContent = SizedBox(
    //   height: screenHeight,
    //   child: const Center(
    //     child: Text(
    //       "Unfortunately, Our Services are not available at your location, Thank you for giving us an opportunity to server you",
    //       softWrap: true,
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    // );

    return nearestSalonList.isNotEmpty
        ? mainContent
        : const CircularProgressIndicator();
  }
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
            fontFamilyName: "Inter",
            fontSize: screenHeight * 0.02 /*18*/,
            fontWeightName: FontWeight.bold,
            color: AppColor.mainBlackColor,
          ),
          InkWell(
            onTap: onPress,
            child: const SmallText(
              text: "View All",
              color: Color(0xff4B5563),
            ),
          ),
        ],
      ),
    );
  }
}

/// correct code here
/*
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
*/

//Old Services code
/*
SizedBox(
  height: screenHeight * 0.129, //115
  child: ListView.builder(
    shrinkWrap: true,
    itemCount: menServicesData.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      /// Column is used here for showing the images along with services name
      return  Column(
        children: [
          Container(
            height: 75,
            width: 75,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.007 /*6*/),
              color: AppColor.imageBgColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageLocation),
              ),
              // image: AssetImage(serviceImages[index].toString()),
            ),
          ),
          SmallText(
            text: serviceName,
            fontSize: 12,
            // text: imageServiceName[index].toString(),
            color: AppColor.quoteColor,
          )
        ],
      ),
    },
  ),
),

*/

/*  Widget build(BuildContext context) {
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
}*/
