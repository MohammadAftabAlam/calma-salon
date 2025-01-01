import 'package:calma/Model/booking_services_model.dart';
import 'package:flutter/material.dart';

import 'package:calma/Data/booking_services_data.dart';
import 'package:calma/widgets/tab_services_trait.dart';

class CancelServicesScreen extends StatefulWidget {
  const CancelServicesScreen({super.key});

  @override
  State<CancelServicesScreen> createState() => _CancelServicesScreenState();
}

class _CancelServicesScreenState extends State<CancelServicesScreen> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<MyBookingServicesModel> cancelData = cancelledServicesData;

    return ListView.builder(
        // shrinkWrap: true,
        itemCount: cancelData.length,
        padding:  EdgeInsets.symmetric( horizontal: screenWidth * 0.0413, //17
          vertical: screenHeight * 0.0169, //24
        ),
        itemBuilder: (context, index) {
          return TabServicesTrait(
            // serviceDate: cancelledServicesData[index].date,
            // serviceTime: cancelledServicesData[index].time,
            // salonImageLoc: cancelledServicesData[index].salonImage,
            // salonName: cancelledServicesData[index].salonName,
            // salonLocation: cancelledServicesData[index].salonLocation,
            servicesModel: cancelData[index],
          );
        });
  }
}

/// Previous Working Code
/*ListView.builder(
        // shrinkWrap: true,
        itemCount: 1,
        padding:  EdgeInsets.symmetric( horizontal: screenWidth * 0.0413, //17
          vertical: screenHeight * 0.0169, //24
        ),
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xffF5EDEC),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth *0.0295,vertical: screenHeight * 0.0135),   //12
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///This row is responsible for showing the data&time of booking and favourite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "June 14, 2023 - 15.00pm",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight * 0.0202, //18
                        ),
                      ),

                      /* *************************** Favourite Heart Button STARTS here************************ */
                      Container(
                        height: screenHeight * 0.0382, //34
                        width: screenWidth * 0.08263,  //34
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                          child: Icon(
                            isFavourite ? Iconsax.heart5 : Iconsax.heart,
                            color: isFavourite ? Colors.red : Colors.black,
                            size: screenHeight * 0.0269, //24
                          ),
                        ),
                      ),
                      /* *************************** Favourite Heart Button ENDS here************************ */

                    ],
                  ),
                  divider(),
                  /* ****************************** Container for showing salon image name and booking id STARTS here  ************************************* */
                  Row(
                    children: [
                      Container(
                        height: screenHeight * 0.1481,
                        width: screenWidth * 0.3,  //125
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenHeight * 0.0148),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("asset/images/salonRoom.jpg"),
                          ),
                        ),
                      ),

                      /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
                      //Expanded Widget is used here for acquiring the rest width of the Row in Container
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.1481,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  fontWeightName: FontWeight.w500,
                                  color: AppColor.mainBlackColor,
                                  text: "Varsha Saloon",
                                  fontSize: screenHeight * 0.018,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Iconsax.location5,
                                      color: AppColor.iconColor,
                                      size: screenHeight * 0.0202,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.0244,
                                    ),
                                    SmallText(
                                      text: "Jogabai Extension",
                                      fontSize: screenHeight * 0.018, //16
                                      fontWeightName: FontWeight.w400,
                                      fontFamilyName: 'Inter',
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Iconsax.check5,
                                      color: AppColor.iconColor,
                                      size: screenHeight * 0.0202,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.0244,
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Booking Id  ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.018, //16
                                          ),
                                        ),
                                        TextSpan(
                                          text: "#AFAY63259",
                                          style: TextStyle(
                                            color: AppColor.textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: screenHeight * 0.018, //16
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* ****************************** Container for showing salon image name and booking id ENDS here  ************************************* */


                  // Button(onPress: (){}, text: "Cancel")

                  divider(),
                  Button(
                    onPress: () {
                      Navigator.pushNamed(context, '/main-salon-show-page');
                    },
                    text: "Rebook",
                    radius: screenHeight * 0.0561,//50,
                    fontSize: screenHeight * 0.0202,//18,
                    fontFamily: "Inter",
                  )
                ],
              ),
            ),
          );
        });*/