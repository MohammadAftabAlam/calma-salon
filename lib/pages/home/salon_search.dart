import 'package:calma/pages/Appointments/Appointment_Process/main_salon_show_pg.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:calma/widgets/stack_img_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SalonSearchPage extends StatefulWidget {
  const SalonSearchPage({super.key});

  @override
  State<SalonSearchPage> createState() => _SalonSearchPageState();
}

class _SalonSearchPageState extends State<SalonSearchPage> {
  TextEditingController searchController = TextEditingController();

  // bool isNearestSelected = false;
  // bool isPopularSelected = false;
  bool isSelected = false;
  bool isSortSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(
            positionedTop: 25,
            onPress: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75, right: 10, left: 10),
            child: Column(
              children: [
                /* *************** Starts Search Bar ********************** */
                SearchBar(
                  controller: searchController,
                  hintText: "Haircut",
                  trailing: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.mic),
                    )
                  ],
                  // onChanged: (String value) {
                  //   debugPrint(value);
                  //   setState(() {
                  //     searchedValue = value;
                  //   }
                ),
                /* *************** Ends Search Bar ********************** */


                /* *************** Starts Nearest Popular & Sort Button ********************* */
                Padding(
                  padding: const EdgeInsets.only(top: 19, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonSalonSearch(text: "Nearest", isSelected: isSelected,),
                      ButtonSalonSearch(text: "Popular", isSelected : isSelected),
                      Container(
                        height: 42,
                        width: 100,
                        decoration: BoxDecoration(
                          color: isSortSelected? AppColor.buttonBackgroundColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: AppColor.buttonBackgroundColor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: /*Dimensions.width5*/5),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isSortSelected = !isSortSelected;
                              });
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset("asset/icons/sortIcon.svg",height: 15,
                                color:  isSortSelected? Colors.white : Colors.black,
                                ),
                                const SizedBox(width: 5,),
                                SmallText(
                                  text: "Sort",
                                  fontWeightName: FontWeight.w600,
                                  color: isSortSelected? Colors.white : Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /* *************** Ends Nearest Popular & Sort Button ********************* */

                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                    padding: EdgeInsets.only(top: screenHeight * 0.0224 /*20*/),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainSalonShowPage()));
                          },
                          child: const Card(
                            margin: EdgeInsets.only(bottom: 15),
                            child: ImageContWithStack(
                                image:
                                    AssetImage("asset/images/salonRoom.jpg")),
                          ),
                        );
                      },
                  ),
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
    return  Container(
      height: 42,
      width: 100,
      decoration: BoxDecoration(
          color: widget.isSelected? AppColor.buttonBackgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: AppColor.buttonBackgroundColor),),
      child: TextButton(
        onPressed: () {
          setState(() {
            widget.isSelected = ! widget.isSelected;
          });
        },
        child: SmallText(
          text: widget.text,
          fontWeightName: FontWeight.w600,
          color: widget.isSelected? Colors.white : Colors.black,
        ),
      ),
    );
  }
}


