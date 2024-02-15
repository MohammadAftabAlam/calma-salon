import 'package:calma/pages/Appointments/Appointment%20Process/salon_search_show_pg.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/Icon_and_text_button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:calma/widgets/stack_img_container.dart';
import 'package:flutter/material.dart';

class SalonSearchPage extends StatefulWidget {
  const SalonSearchPage({super.key});

  @override
  State<SalonSearchPage> createState() => _SalonSearchPageState();
}

class _SalonSearchPageState extends State<SalonSearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      const ButtonSalonSearch(text: "Nearest"),
                      const ButtonSalonSearch(text: "Popular"),
                      Container(
                        height: 42,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: AppColor.buttonBackgroundColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: /*Dimensions.width5*/5),
                          child: TextButton(
                            onPressed: () {},
                            child: const IconAndTextButton(
                              text: "Sort",
                              iconData: Icons.sort,
                              fontWeight: FontWeight.w600,
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

class ButtonSalonSearch extends StatelessWidget {
  final String text;
  const ButtonSalonSearch({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: AppColor.buttonBackgroundColor)),
      child: TextButton(
        onPressed: () {},
        child: SmallText(
          text: text,
          fontWeightName: FontWeight.w600,
        ),
      ),
    );
  }
}
