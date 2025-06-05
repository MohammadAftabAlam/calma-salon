import 'package:calma/Data/salon_details_data.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:calma/widgets/stack_img_container.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SalonSearchPage extends StatefulWidget {
  const SalonSearchPage({super.key});

  @override
  State<SalonSearchPage> createState() => _SalonSearchPageState();
}

class _SalonSearchPageState extends State<SalonSearchPage> {
  TextEditingController searchController = TextEditingController();

  bool isSelected = false;
  bool isSortSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final searchServiceName = ModalRoute.of(context)!.settings.arguments;
    searchController.text = searchServiceName.toString();
    Widget availableSalon = ListView.builder(
      shrinkWrap: true,
      itemCount: salonDetailsData.length,
      padding: EdgeInsets.only(top: screenHeight * 0.0224 /*20*/),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/main-salon-show-page',
              arguments: {
                'salonName': salonDetailsData[index].salonName,
                'image': salonDetailsData[index].salonImagePath,
                'location': salonDetailsData[index].salonLocation,
                'distance': salonDetailsData[index].distance
                    .toString(),
                'rating': salonDetailsData[index].rating,
                'fullAddress': salonDetailsData[index].fullAddress,
              },
            );
          },
          child: Card(
            margin: EdgeInsets.only(
              bottom: screenHeight * 0.0168, /*15,*/
            ),
            child: ImageContWithStack(
              text:salonDetailsData[index].salonName,
              image: AssetImage(salonDetailsData[index].salonImagePath),
              location: salonDetailsData[index].salonLocation,
              gender: salonDetailsData[index].genderType,
              distance: salonDetailsData[index].distance,
              rating: salonDetailsData[index].rating,
            ),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(
            positionedTop: 40, //25,
            // positionedTop: screenHeight * 0.0281, //25,
            onPress: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.1042 /*75*/,
              right: screenWidth * 0.0243 /*10*/,
              left: screenWidth * 0.0243 /*10*/,
            ),
            child: Column(
              children: [
                /* *************** Starts Search Bar ********************** */
                SearchBar(
                  controller: searchController,
                  hintText: "Search your services here",
                  trailing: [
                    Padding(
                      padding:
                          EdgeInsets.only(right: screenWidth * 0.0243 /*10*/),
                      child: const Icon(Icons.mic),
                    )
                  ],
                ),
                /* *************** Ends Search Bar ********************** */

                /* *************** Starts Nearest Popular & Sort Button ********************* */
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.0224 /*20*/,
                      bottom: screenHeight * 0.005 /*5*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonSalonSearch(
                        text: "Nearest",
                        isSelected: isSelected,
                      ),
                      ButtonSalonSearch(
                          text: "Popular", isSelected: isSelected),
                      // Container(
                      //   height: screenHeight * 0.0471, //42,
                      //   width: screenWidth * 0.2431, //100,
                      //   decoration: BoxDecoration(
                      //     color: isSortSelected
                      //         ? AppColor.buttonBackgroundColor
                      //         : Colors.transparent,
                      //     borderRadius:
                      //         BorderRadius.circular(screenHeight * 0.0112),
                      //     border:
                      //         Border.all(color: AppColor.buttonBackgroundColor),
                      //   ),
                      //   child: Padding(
                      //     padding:
                      //         EdgeInsets.only(left: screenWidth * 0.0122 /*5*/),
                      //     child: TextButton.icon(
                      //       onPressed: () {
                      //         setState(() {
                      //           isSortSelected = !isSortSelected;
                      //         });
                      //       },
                      //       icon: SvgPicture.asset(
                      //         "asset/icons/sortIcon.svg",
                      //         height: screenHeight * 0.0168, //15,
                      //         colorFilter: ColorFilter.mode(isSortSelected ? Colors.white : Colors.black, BlendMode.srcIn),
                      //       ),
                      //       label: SmallText(
                      //         text: "Sort",
                      //         fontWeightName: FontWeight.w600,
                      //         color:
                      //             isSortSelected ? Colors.white : Colors.black,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                /* *************** Ends Nearest Popular & Sort Button ********************* */

                Expanded(
                  child: availableSalon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSalonSearch extends StatefulWidget {
  final String text;
  bool isSelected;
  ButtonSalonSearch({super.key, required this.text, required this.isSelected});

  @override
  State<ButtonSalonSearch> createState() => _ButtonSalonSearchState();
}

class _ButtonSalonSearchState extends State<ButtonSalonSearch> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.0471, //42,
      width: screenWidth * 0.2431, //100,
      decoration: BoxDecoration(
        color: widget.isSelected
            ? AppColor.buttonBackgroundColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColor.buttonBackgroundColor),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
        },
        child: SmallText(
          text: widget.text,
          fontWeightName: FontWeight.w600,
          color: widget.isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
