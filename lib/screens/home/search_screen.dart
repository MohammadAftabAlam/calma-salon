import 'dart:math';

import 'package:calma/Data/salon_expert_data.dart';
import 'package:calma/Data/services_data.dart';
import 'package:calma/Model/salon_expert.dart';
import 'package:calma/Model/services_model.dart';
import 'package:calma/widgets/services_trait.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchPage extends StatefulWidget {
  final bool isUsingNavigator;
  const SearchPage({super.key, this.isUsingNavigator = false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  final stt.SpeechToText _speechToText = stt.SpeechToText();
  String _recognizedText = "";
  bool isListening = false;

  get screenHeight => MediaQuery.of(context).size.height;
  get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _initStateSpeech();
  }

  void _initStateSpeech() async {
    bool available = await _speechToText.initialize();
    if (!mounted) return;

    setState(() {
      isListening = available;
    });
  }

/* ******************** Start Listen Open the mic for Listening the voice STARTS HERE ************************* */
  void _startListening() {
    _speechToText.listen(onResult: (result) {
      setState(() {
        _recognizedText = result.recognizedWords;
      });
    });
    setState(() {
      isListening = true;
    });
  }
/* ******************** Start Listen Open the mic for Listening the voice ENDS HERE ************************* */

  /// Remove all recent searches
  removeRecentSearches() {
    setState(() {
      recentSearches.removeRange(0, recentSearches.length);
    });
  }

  List recentSearches = [
    "Haircut",
    "Most Rated",
    "Haircut",
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    Random random = Random();
    ServicesModel service1 =
        menServicesData[random.nextInt(menServicesData.length)];
    ServicesModel service2 =
        menServicesData[random.nextInt(menServicesData.length)];

    SalonExperts salonExperts = expertDetailData[random.nextInt(expertDetailData.length)];

    while (service1 == service2) {
      service1 = menServicesData[random.nextInt(menServicesData.length)];
      service2 = menServicesData[random.nextInt(menServicesData.length)];
    }

    /// Changing the search bar value with the text [_recognizedText] that is recognized while Listening
    searchController.text = _recognizedText;

    Widget quickPickedContent = Row(
      children: [
        ServicesTrait(
          serviceName: service1.serviceName,
          imageLocation: service1.imageLocation,
          boxShape: BoxShape.circle,
        ),
        SizedBox(
          width: screenWidth * 0.0122,  //5
        ),

        Column(
          children: [
            Container(
              height: screenHeight * 0.1203/*125*/,
              width: screenWidth * 0.2917 /*120*/,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.imageBgColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(salonExperts.imagePath),
                  // image: AssetImage("${expertBarberImages[index]}"),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight * 0.1010, //90,
                    left: screenWidth * 0.0972, //40,
                    // top: 90,
                    //   left: 40,
                    child: Container(
                      // height: screenHeight * 0.0336, //30,
                      height: 20,
                      width: screenWidth * 0.12153, //50,
                      decoration: BoxDecoration(
                          color: const Color(0xff85ABB8),
                          borderRadius: BorderRadius.circular(
                              screenHeight * 0.01123 /*10*/)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          SmallText(
                            text: salonExperts.rating
                                .toString(),
                            fontSize:
                            screenHeight * 0.01123 /*10*/,
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
              text: salonExperts.name,
              fontSize: 12,
              color: AppColor.quoteColor,
            ),
          ],
        ),
        SizedBox(
          width: screenWidth * 0.0122,  //5
        ),
        ServicesTrait(
          serviceName: service2.serviceName,
          imageLocation: service2.imageLocation,
          boxShape: BoxShape.circle,
        ),
      ],
    );

    /// Recent Search Content
    Widget recentSearchContent = SizedBox(
      height: 40,
      width: screenWidth,
      // decoration: BoxDecoration(border: Border.all()),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recentSearches.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(foregroundColor: const Color(0xff5F6368)),
                child: Text(
                  recentSearches[index],
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColor.textColor2,
                  ),
                ),
              ),
            );
          }),
    );

    /// Search Bar Widget
    Widget searchBar = SearchBar(
      controller: searchController,
      onChanged: (searchValue) {
        searchController.text = searchValue;
      },
      hintText: "Search salons or services",
      hintStyle: WidgetStateProperty.resolveWith((states) {
        return const TextStyle(
          fontSize: 14,
          fontFamily: "Inter",
          color: Color(0xff9CA3AF),
        );
      }),
      shape: WidgetStateProperty.resolveWith((callback) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      }),
      backgroundColor: const WidgetStatePropertyAll(Color(0xffECEEF1)),
      shadowColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
      textCapitalization: TextCapitalization.words,
      padding:
          const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 0)),
      leading: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.024 /*10*/),
        child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("asset/icons/search.svg"),
        ),
      ),
      trailing: [
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.024 /*10*/),
          child: IconButton(
            onPressed: () {
              _startListening();
              setState(() {
                _showDialog(_recognizedText);
              });
            },
            icon: isListening
                ? SvgPicture.asset(
                    "asset/icons/microphone.svg",
                    height: screenHeight * 0.036 /*32*/,
                  )
                : const Icon(Icons.mic_off),
            tooltip: 'Speech Recognition',
          ),
        ),
      ],
    );

    Widget mainContent = Padding(
      padding: EdgeInsets.only(
        top: widget.isUsingNavigator
            ? screenHeight * 0.048 /*50*/
            : screenHeight * 0.0674 /*60*/,
        left: screenWidth * 0.024 /*10*/,
        right: screenWidth * 0.024 /*10*/,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* ******************************** Search Bar STARTS here ************************************* */
          widget.isUsingNavigator
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackArrowButton(onPress: () {
                      Navigator.pop(context);
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    searchBar,
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: searchBar,
                ),
          /* ******************************** Search Bar ENDS here ************************************* */

          /// Body of Search Screen
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Recent Search Text and Clear All Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Searches",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.mainBlackColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        removeRecentSearches();
                      },
                      child: const Text(
                        "Clear All",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor2),
                      ),
                    )
                  ],
                ),

                recentSearches.isNotEmpty
                    ? recentSearchContent

                    /// if List[recentSearch] is Empty
                    : const SmallText(
                        text: "Oh! No Recent Searches,\nSearch Something",
                        textAlignName: TextAlign.center,
                        softWrap: true,
                        fontSize: 16,
                      ),

                const SizedBox(
                  height: 20,
                ),

                /// Quick Pick Text
                const Text(
                  "Quick Pick",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainBlackColor,
                  ),
                ),

                /// Quick Pick Content
                quickPickedContent,
                const SizedBox(height: 75,),
                const BigText(
                  text:
                      '"Beauty begins the moment you decide to be yourself."\n — Coco Chanel',
                  textAlignName: TextAlign.center,
                  fontSize: 18,
                  color: Color.fromRGBO(23, 120, 136, 0.60),
                )
              ],
            ),
          ),
        ],
      ),
    );

    Widget calledUsingNavigator = SizedBox(
      height: screenHeight,
      child: Scaffold(
        body: mainContent,
      ),
    );

    return widget.isUsingNavigator ? calledUsingNavigator : mainContent;
  }

  /* **************************** Dialog box to show recognized word STARTS here ********************* */
  void _showDialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColor.mainBackgroundColor,
          title: const Text("Speech Recognition"),
          titleTextStyle: TextStyle(
              fontSize: screenHeight * 0.020 /*18*/, color: Colors.black54),
          titlePadding: EdgeInsets.only(
              top: 20,
              right: screenWidth * 0.1215 /*50*/,
              left: screenWidth * 0.1215 /*50*/,
              bottom: screenHeight * 0.006 /*5*/),
          content: Container(
            height: screenHeight * 0.0674 /*60*/,
            width: screenWidth * 0.243, //100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(screenHeight * 0.0112 /*10*/),
            ),
            child: Text(
              _recognizedText.isEmpty ? "Result here..." : text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: screenHeight * 0.016 /*14*/,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter"),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: screenHeight * 0.056, //50,
                width: screenWidth * 0.1215, //50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black38)),
                child: const Center(child: Text("X")),
              ),
            ),
          ],
        );
      },
    );
  }
/* **************************** Dialog box to show recognized word ENDS here ********************* */
}

/* ********************************** Black button on card STARTS from here****************************** */
class ForwardArrowButton extends StatelessWidget {
  final double screenHeight, screenWidth;
  const ForwardArrowButton(
      {super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.045, //40
      width: screenWidth * 0.0972, //40,
      decoration: BoxDecoration(
          color: const Color(0xff1E1F2E),
          borderRadius: BorderRadius.circular(screenHeight * 0.0112 /*10*/)),
      child: Center(
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/salon-search-page',
                arguments: "Haircut");
          },
          icon: const Icon(Icons.arrow_forward),
          color: Colors.white,
          iconSize: screenHeight * 0.030, //27,
        ),
      ),
    );
  }
}
/* ********************************** Black button on card ENDS here****************************** */

/// Grid Controller for Recent Searches
/*GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.3,
                    ),
                    children: [
                      for (final search in recentSearches)
                        Container(
                          // height: 100,
                          // width: 100,
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          child: OutlinedButton(
                            onPressed: (){},
                            child: Text(
                              search,
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColor.textColor2,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),*/
// Working previous code
/*
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    /// Changing the search bar value with the text [_recognizedText] that is recognized while Listening
    searchController.text = _recognizedText;
    ImagesAndText imagesAndText = ImagesAndText();

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.0674/*60*/, left: screenWidth * 0.024 /*10*/, right: screenWidth * 0.024 /*10*/),
        child: Column(
          children: [
            /* ******************************** Search Bar STARTS here ************************************* */
            SearchBar(
              controller: searchController,
              hintText: "Search for services",
              leading: Padding(
                padding:  EdgeInsets.only(left: screenWidth * 0.024 /*10*/),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              ),
              trailing: [
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.024 /*10*/),

                  child: IconButton(
                      onPressed: (){
                        _startListening();
                        _showDialog(_recognizedText);
                      },
                    icon: isListening? SvgPicture.asset("asset/icons/microphone.svg", height: screenHeight * 0.036 /*32*/,): const Icon(Icons.mic_off),
                    tooltip: 'Speech Recognition',
                ),
                ),
              ],
            ),
            /* ******************************** Search Bar ENDS here ************************************* */

            /* **************************** showing the list of services STARTS here ********************* */
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: imagesAndText.imageAndText[0].length,
                padding: EdgeInsets.only(top: screenHeight * 0.0224 /*20*/),
                itemBuilder: (context, index) {

                  /* ************************************ Card which is showing the services name and images STARTS here ***************************** */
                  return Card(
                    margin: EdgeInsets.only(
                        bottom: screenHeight * 0.0168 /*15*/),
                    child: Row(
                      children: [
                        /* ************************* Image container STARTS here ******************** */
                        Container(
                          height: 130,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(screenHeight * 0.0123/*11*/),
                              topRight: Radius.circular(screenHeight * 0.0123/*11*/),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(imagesAndText.imageAndText[0][index].toString()),
                              // image: AssetImage("asset/images/haircut.jpg"),
                            ),
                          ),
                        ),
                        /* ************************* Image container ENDS here ******************** */

                        //Expanded Widget is used here for acquiring the rest width of the Row in Container
                        Expanded(
                            child: Stack(
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  color: AppColor.statusBookServiceColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(screenHeight * 0.0123/*11*/),
                                    bottomRight: Radius.circular(screenHeight * 0.0123/*11*/),
                                  )
                              ),
                              /* ************************* Service Detail and Name STARTS here ******************** */
                              child: Padding(
                                padding: EdgeInsets.only(left: screenWidth * 0.024 /*10*/, top: screenHeight * 0.006 /*5*/),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /* ************************* Service Name STARTS here ******************** */
                                    BigText(
                                      fontWeightName: FontWeight.w600,
                                      color: AppColor.quoteColor,
                                      text: imagesAndText.imageAndText[1][index],
                                      // text: 'Bride Makeup',
                                      fontSize: screenHeight * 0.020, //18
                                    ),
                                    /* ************************* Service name ENDS here ******************** */

                                    /* ************************* Service Detail STARTS here ******************** */
                                    Padding(
                                      padding: EdgeInsets.only(right: screenWidth * 0.024 /*10*/),
                                      child: SmallText(
                                          textAlignName: TextAlign.justify,
                                          fontSize: screenHeight * 0.0135,//12
                                          fontFamilyName: "Inter",
                                          text:
                                              "From messy manes to chic frames, our scissors tell the tale of stylish transformations. Because every haircut deserves a sprinkle of laughter !"),
                                    ),
                                    /* ************************* Service Detail ENDS here ******************** */

                                  ],
                                ),
                              ),
                              /* ************************* Service Detail and Name ENDS here ******************** */

                            ),
                            Positioned(
                              top: screenHeight * 0.0954 /*85*/, left: screenWidth * 0.547/*225*/,
                              child: ForwardArrowButton(screenHeight: screenHeight,screenWidth: screenWidth,),
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                  /* ************************************ Card which is showing the services name and images STARTS here ***************************** */

                },
              ),
            ),
            /* **************************** showing the list of services STARTS here ********************* */

          ],
        ),
      ),
    );
  }
*/

/*Facebook search option */
// Expanded(
//   child: ListView.builder(
//       itemCount: 5000,
//       itemBuilder: (context, index){
//         late String position = index.toString();
//         if(searchController.text.isEmpty){
//           return ListTile(
//             leading: CircleAvatar(child: Image(image: AssetImage("asset/images/fbLogo.png"),),),
//             trailing: Icon(Icons.more_vert_outlined),
//             title: Text("Facebook "+ (index+1).toString()),
//             subtitle: Text("do u love watching facebook"),
//           );
//         }
//
//         else if(position.toLowerCase().contains(searchController.text.toLowerCase()))
//         {
//           return ListTile(
//             leading: CircleAvatar(child: Image(image: AssetImage("asset/images/fbLogo.png"),),),
//             trailing: Icon(Icons.more_vert_outlined),
//             title: RichText(
//               text: TextSpan(
//                 text: "Facebook ",
//                 style: DefaultTextStyle.of(context).style,
//                 children: <TextSpan>[
//                   TextSpan(text: position.toString(), style: TextStyle(color: Colors.red))
//                 ],
//               ),
//             ),
//             subtitle: Text("do u love watching facebook"),
//           );
//         }
//         // else if(!position.toLowerCase().contains(searchController.text.toLowerCase())){
//         //   return Container(child: Text("Not Found"));
//         // }
//         else{
//           return Container();
//         }
//       },
//   ),
// )
