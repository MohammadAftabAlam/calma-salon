import 'package:calma/pages/home/salon_search.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  final stt.SpeechToText _speechToText =  stt.SpeechToText();
  String _recognizedText = "";
  bool isListening = false;

  get screenHeight => MediaQuery.of(context).size.height;
  get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initStateSpeech();
  }

  void _initStateSpeech()async{
    bool available = await _speechToText.initialize();
    if(!mounted) return;

    setState(() {
      isListening = available;
    });
  }
/* ******************** Start Listen Open the mic for Listening the voice STARTS HERE ************************* */
  void _startListening(){
    _speechToText.listen(onResult: (result){
      setState(() {
        _recognizedText = result.recognizedWords;
      });
    });
    setState(() {
      isListening = true;
    });
  }
/* ******************** Start Listen Open the mic for Listening the voice ENDS HERE ************************* */

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    /// Changing the search bar value with the text [_recognizedText] that is recognized while Listening
    searchController.text = _recognizedText;

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

                    icon: isListening? SvgPicture.asset("asset/icons/microphone.svg", height: screenHeight * 0.036 /*32*/,): Icon(Icons.mic_off),

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
                itemCount: 10,
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
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("asset/images/haircut.jpg"),
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
                                      text: 'Bride Makeup',
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

  /* **************************** Dialog box to show recognized word STARTS here ********************* */
  void _showDialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColor.mainBackgroundColor,
          title: const Text("Speech Recognition"),
          titleTextStyle: TextStyle(fontSize: screenHeight * 0.020 /*18*/, color: Colors.black54),
          titlePadding: EdgeInsets.only(top: 20,right: screenWidth *0.1215/*50*/,left: screenWidth *0.1215/*50*/,bottom: screenHeight * 0.006 /*5*/),
          content: Container(
            height: screenHeight * 0.0674/*60*/,
            width: screenWidth * 0.243,//100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(screenHeight *0.0112/*10*/),
            ),
            child: Text(_recognizedText.isEmpty ? "Result here...": text, textAlign: TextAlign.center,style: TextStyle(color: Colors.teal,fontSize: screenHeight * 0.016/*14*/,fontWeight: FontWeight.w400,fontFamily: "Inter"),),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: screenHeight * 0.056,//50,
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
  const ForwardArrowButton({super.key, required this.screenHeight,required this.screenWidth });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.045, //40
      width: screenWidth * 0.0972,//40,
      decoration: BoxDecoration(
          color: const Color(0xff1E1F2E),
          borderRadius: BorderRadius.circular(screenHeight * 0.0112/*10*/)),
      child: Center(
        child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SalonSearchPage()));
          },
          icon: const Icon(Icons.arrow_forward),
          color: Colors.white,
          iconSize: screenHeight *0.030,//27,
        ),
      ),
    );
  }
}
/* ********************************** Black button on card ENDS here****************************** */



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
