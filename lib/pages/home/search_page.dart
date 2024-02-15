import 'package:calma/pages/home/salon_search.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchedValue = "";
  TextEditingController searchController = TextEditingController();

  SpeechToText speechToText = SpeechToText();
  String _lastWords ='';
  bool _serviceEnabled = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// initSpeech() is used to ask permission to record audio
  void _initSpeech() async{
    _serviceEnabled = await speechToText.initialize();
    setState(() {});
  }


  /// _startListening() is used to record the audio of the user
   _startListening() async{
    await speechToText.listen(onResult: _onResult);
    setState(() {});
  }

  /// _stopListening is used to stop the recording of the user's audio
   _stopListening() async{
    await speechToText.stop();
    setState(() {});
  }

   _onResult(SpeechRecognitionResult result){
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }
  /*Speech Recognition page */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Column(
          children: [
            SearchBar(
              controller: searchController,
              hintText: "Search for salon, services &more",
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              ),
              trailing: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),

                  /******************** Currently we are working here ***************************/
                  child: IconButton(
                      onPressed: () {
                        // If not yet listening for speech start, otherwise stop
                        // speechToText.isNotListening ? _stopListening : _startListening;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SpeechRecognitionPage()));4


                         if(_serviceEnabled){
                           _showDialog();
                           speechToText.isNotListening? _startListening() : _stopListening();
                         }
                        // setState(() {});
                      },
                        tooltip: 'Listen',


                    // onPressed: speechToText.isNotListening? _startListening() : _stopListening(),
                      icon: Icon( speechToText.isNotListening ?
                      Icons.mic : Icons.mic_off,),
                  ),
                ),
              ],
              onChanged: (String value) {
                debugPrint(value);
                setState(() {
                  searchedValue = value;
                });
              },
            ),


            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(
                        bottom: /*Dimensions.height15*/ 15),
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(11),
                              topRight: Radius.circular(11),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("asset/images/hairCut.jpg"),
                            ),
                          ),
                        ),

                        /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
                        //Expanded Widget is used here for acquiring the rest width of the Row in Container
                        Expanded(
                            child: Stack(
                          children: [
                            Container(
                              height: 130,
                              decoration: const BoxDecoration(
                                  color: AppColor.statusBookServiceColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(11),
                                    bottomRight: Radius.circular(11),
                                  )),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10, top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                      fontWeightName: FontWeight.w600,
                                      color: AppColor.quoteColor,
                                      text: 'Bride Makeup',
                                      fontSize: 18,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: SmallText(
                                          textAlignName: TextAlign.justify,
                                          fontSize: 12,
                                          fontFamilyName: "Inter",
                                          text:
                                              "From messy manes to chic frames, our scissors tell the tale of stylish transformations. Because every haircut deserves a sprinkle of laughter !"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                                top: 83, left: 225, child: ForwardArrowButton(),
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColor.mainBackgroundColor,
          icon: IconButton(
            onPressed: () {
              _stopListening();
              Navigator.pop(context);
            },
            icon: Icon( speechToText.isNotListening ?
              Icons.mic : Icons.mic_off,
              size: 50,
            ),
          ),
          title: Text( speechToText.isNotListening ? "Tap the mic to stop Listening": '$_lastWords'),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red)),
                child: const Center(child: Text("X")),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SpeechRecognitionPage extends StatefulWidget {
  const SpeechRecognitionPage({super.key});

  @override
  State<SpeechRecognitionPage> createState() => _SpeechRecognitionPageState();
}

class _SpeechRecognitionPageState extends State<SpeechRecognitionPage> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    // _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    // await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    // await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  // If listening is active show the recognized words
                  _speechToText.isListening
                      ? '$_lastWords'
                      // If listening isn't active but could be tell the user
                      // how to start it, otherwise indicate that speech
                      // recognition is not yet ready or not supported on
                      // the target device
                      : _speechEnabled
                          ? 'Tap the microphone to start listening...'
                          : 'Speech not available',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            // If not yet listening for speech start, otherwise stop
            _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}

                                  ///Not Working here
class ForwardArrowButton extends StatelessWidget {
  const ForwardArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: const Color(0xff1E1F2E),
          borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SalonSearchPage()));
          },
          icon: const Icon(Icons.arrow_forward),
          color: Colors.white,
          iconSize: 27,
        ),
      ),
    );
  }
}

/*SearchBar(
            // padding: ,
            controller: searchController,
            hintText: "Search for salon, services &more",
            trailing: const <Widget> [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.mic),
              )
            ],
            leading: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.search_outlined),
            ),
            onChanged: (String value){
              debugPrint(value);
              setState(() {
                searchedValue = value;
              });
            },
          ),
 */

//Facebook search option
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
