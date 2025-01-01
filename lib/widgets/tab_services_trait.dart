import 'package:calma/provider/favourite_salon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import 'package:calma/Model/booking_services_model.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';

class TabServicesTrait extends ConsumerWidget {
  const TabServicesTrait({
    super.key,
    required this.servicesModel,
    this.isCancelTab = false,
  });
  final MyBookingServicesModel servicesModel;
  final bool isCancelTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    
    // final favouriteSalon = ref.watch(favouriteSalonProvider);
    // final isFavouriteSalon = ref.watch(favouriteSalonProvider.notifier).toggleFavouriteSalonStatus(servicesModel)
    
    return Card(
      color: const Color(0xffF5EDEC),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.0295,
            vertical: screenHeight * 0.0056), //12, //5
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Date & Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // "$servicesModel. - $serviceTime",
                  "${servicesModel.date} - ${servicesModel.time}",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.0202, //18
                  ),
                ),
                Container(
                  height: screenHeight * 0.0382, //34
                  width: screenWidth * 0.08263, //34
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    Iconsax.heart ,
                    color: Colors.red,
                    size: screenHeight * 0.0269, //24
                  ),
                ),
              ],
            ),
            divider(),

            /* ****************************** Container for showing salon image name and booking id STARTS here  ************************************* */
            Row(
              children: [
                /// Salon Image
                Container(
                  height: screenHeight * 0.1404, //125,
                  width: screenWidth * 0.304, //125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight * 0.0148),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(servicesModel.salonImage),
                    ),
                  ),
                ),

                //Expanded Widget is used here for acquiring the rest width of the Row in Container
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Salon Name
                        BigText(
                          fontWeightName: FontWeight.w500,
                          color: AppColor.mainBlackColor,
                          text: servicesModel.salonName,
                          fontSize: screenHeight * 0.018,
                        ),

                        /// Location
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Location Icon
                            Icon(
                              Iconsax.location5,
                              color: AppColor.iconColor,
                              size: screenHeight * 0.0202,
                            ),

                            SizedBox(
                              width: screenWidth * 0.0244,
                            ),

                            /// Location Text
                            SmallText(
                              text: servicesModel.salonLocation,
                              fontSize: screenHeight * 0.018, //16
                              fontWeightName: FontWeight.w400,
                              fontFamilyName: 'Inter',
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.0056,
                        ), //5
                        /// Booking Id
                        Row(
                          children: [
                            /// Booking Id Icon
                            Icon(
                              Iconsax.check5,
                              color: AppColor.iconColor,
                              size: screenHeight * 0.0202,
                            ),
                            SizedBox(
                              width: screenWidth * 0.0244,
                            ),

                            /// Booking Id
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
                        SizedBox(
                          height: screenHeight * 0.0056,
                        ), //5

                        /// Direction Button
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text(
                            "\t\t Direction",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          icon: const Icon(
                            Iconsax.route_square5,
                            color: AppColor.textColor2,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffE5E7EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /* ****************************** Container for showing salon image name and booking id ENDS here  ************************************* */

            divider(),
            /* ****************************** Rebook & Add Review STARTS here  ************************************* */
            isCancelTab
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        onPress: () {
                          Navigator.pushNamed(context, '/salon-search-page');
                        },
                        text: "Rebook",
                        textColor: const Color(0xff1C2A3A),
                        buttonColor: const Color(0xffE5E7EB),
                      ),
                      SizedBox(
                        width: screenWidth * 0.0486,
                      ),
                      Button(
                        onPress: () {},
                        text: "Add Review",
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      bottom: screenHeight * 0.005, /*5*/
                    ),
                    child: Center(
                      child: Button(
                        onPress: () {},
                        text: "Book Now",
                        width: screenWidth * 0.7535, //310,
                      ),
                    ),
                  ),
            /* ****************************** Rebook & Add Review ENDS here  ************************************* */
          ],
        ),
      ),
    );
  }

  divider() {
    return const Divider(
      thickness: 1,
      color: Color(0xffD3CECD),
    );
  }
}
