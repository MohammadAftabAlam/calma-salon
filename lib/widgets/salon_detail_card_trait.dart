import 'package:calma/Model/salon_details_model.dart';
import 'package:calma/provider/favourite_salon_provider.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class SalonDetailCardTrait extends ConsumerWidget {
  const SalonDetailCardTrait({super.key, required this.salonDetail});
  final SalonDetails salonDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    // final favouriteSalon = ref.watch(favouriteSalonProvider);
    // final isSalonFavourite = ref.watch(favouriteSalonProvider.notifier).toggleFavouriteSalonStatus(salonDetail);

    return Card(
      color: const Color(0xffFFFBFB),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffF3F4F6)),
          borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: const Color.fromRGBO(48, 48, 48, 0.5),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0194, //8,
          vertical: screenHeight * 0.0135, // 12
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* ****************************** Container for showing salon image name and booking id STARTS here  ************************************* */
            Row(
              children: [
                /// Salon Image
                Container(
                  height: screenHeight * 0.1459, //130,
                  width: screenWidth * 0.3111, //128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight * 0.0148),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(salonDetail.salonImagePath),
                    ),
                  ),
                ),

                //Expanded Widget is used here for acquiring the rest width of the Row in Container
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.0243 /*10*/),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Salon Name & Favourite
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: salonDetail.salonName,
                              fontWeightName: FontWeight.w700,
                              color: AppColor.darkTealColor,
                              fontSize: screenHeight * 0.018, //16,
                            ),

                            /// Favourite Logic
                            Container(
                              height: screenHeight * 0.0382, //34
                              width: screenWidth * 0.08263, //34
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),

                              child: GestureDetector(
                                onTap: (){
                                  debugPrint("Favourite icon tapped of  " + salonDetail.salonName);
                                },
                                child: Icon(
                                  Iconsax.heart5 ,
                                  color: Colors.red,
                                  size: screenHeight * 0.0269, //24
                                ),
                              ),
                            ),
                          ],
                        ),

                        divider(),

                        /// Services That a Salon Provide
                        const Row(
                          children: [
                            SmallText(
                              text: "Haircut, ",
                              color: Color(0xff4B5563),
                              fontFamilyName: "Inter",
                              fontWeightName: FontWeight.w600,
                            ),
                            SmallText(
                                text: "Bridal Makeup",
                                color: Color(0xff4B5563),
                              fontFamilyName: "Inter",
                              fontWeightName: FontWeight.w600,
                            ),
                            SmallText(
                                text: " & more", color: Color(0xff4B5563),
                              fontFamilyName: "Inter",
                              fontWeightName: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.0056/*5*/,),

                        /// Location
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Location Icon
                            Icon(
                              Iconsax.location,
                              color: const Color(0xff4B5563),
                              size: screenHeight * 0.0202,
                            ),

                            SizedBox(
                              width: screenWidth * 0.01, //4
                            ),

                            /// Location Text
                            SizedBox(
                              width: screenWidth * 0.498, //205,
                              child: Text(
                                salonDetail.salonLocation,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenHeight * 0.016, //16
                                  color: AppColor.grayColor600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: screenHeight * 0.0056, //5
                        ),

                        /// Ratings and Reviews
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              SvgPicture.asset("asset/icons/star.svg", width: 10,height: 15, colorFilter: const ColorFilter.mode(Color(0xffFEB052), BlendMode.srcIn),),
                              SizedBox(
                                width: screenWidth * 0.01, //4
                              ),
                              Text(
                                salonDetail.rating,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenHeight * 0.01347, // 12,
                                  color: AppColor.grayColor500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: screenWidth * 0.0194, //8
                              ),
                              const VerticalDivider(
                                width: 2,
                                color: Color(0xffE5E7EB),
                              ),
                              SizedBox(
                                width: screenWidth * 0.0194, //8
                              ),
                              Text(
                                 "${salonDetail.review} Reviews",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenHeight * 0.01347, // 12,
                                  color: const Color(0xff6B7280),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: screenHeight * 0.0112, // 10,
                              width: screenWidth * 0.0243, //10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: salonDetail.isSeatVacant
                                      ? AppColor.iconColor
                                      : Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.01, //4
                            ),
                            salonDetail.isSeatVacant
                                ? BigText(
                                    text: "Available Now",
                                    fontSize: screenHeight * 0.0157 /*14*/,
                                    color: const Color(0xff177888),
                                  )
                                : BigText(
                                    text: "Not Available",
                                    fontSize: screenHeight * 0.0157 /*14*/,
                                    color: Colors.red,
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
