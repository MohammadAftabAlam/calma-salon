import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

// class SpeechRecognitionPage extends StatefulWidget {
//   const SpeechRecognitionPage({super.key});
//
//   @override
//   State<SpeechRecognitionPage> createState() => _SpeechRecognitionPageState();
// }
//
// class _SpeechRecognitionPageState extends State<SpeechRecognitionPage> {
//   // 1.
//   late SpeechRecognition _speech;
// // 2.
//   bool _isSpeechStarted = false;
// // 3.
//   bool _isListening = false;
// // 4.
//   String transcription = '';
//   String currentText = '';
// // 5.
//   bool _isEndOfSpeech = false;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         bottomNavigationBar: Container(
//           height: 200,
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // 1. <-- SEE HERE
//               if (!_isSpeechStarted) ...[
//                 FloatingActionButton(
//                   backgroundColor: const Color(0xff764abc),
//                   child: Icon(
//                     Icons.mic,
//                     size: 35,
//                   ),
//                   onPressed: () {
//                     _startSpeechRecognition();
//                   },
//                 ),
//               ] else ...[
//                 FloatingActionButton(
//                   backgroundColor: const Color(0xff764abc),
//                   child: Icon(
//                     Icons.stop,
//                     size: 35,
//                   ),
//                   onPressed: () {
//                     _stopSpeechRecognition();
//                   },
//                 ),
//               ],
//               // 2. <-- SEE HERE
//               if (_isListening) ...[
//                 Text(
//                   kListening,
//                   style: GoogleFonts.nunito(
//                       textStyle:
//                       TextStyle(color: Colors.black, fontSize: 22.5)),
//                 ),
//               ],
//             ],
//           ),
//         ),
//         appBar: AppBar(
//           title: Text('Voice Assistant'),
//           backgroundColor: const Color(0xff764abc),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       _ttsGreet,
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             fontSize: 30.5, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // 3. <-- SEE HERE
//                 TextField(
//                   controller: _myController,
//                   readOnly: true,
//                   onChanged: (String text) {
//                     setState(() {
//                       _isContentsPresent = text.isNotEmpty;
//                     });
//                   },
//                   //focusNode: _nodeText1,
//                   cursorColor: Colors.grey,
//                   style:
//                   GoogleFonts.poppins(textStyle: TextStyle(fontSize: 30.5)),
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintStyle: GoogleFonts.nunito(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// // 1.
//   void _activateSpeechRecognizer() {
//     _requestPermission();
//     _speech = SpeechToText();
//     _speech.setAvailabilityHandler(onSpeechAvailability);
//     _speech.setRecognitionStartedHandler(onRecognitionStarted);
//     _speech.setRecognitionResultHandler(onRecognitionResult);
//     _speech.setRecognitionCompleteHandler(onRecognitionComplete);
//     _speech
//         .activate()
//         .then((res) => setState(() => _speechRecognitionAvailable = res));
//   }
// // 2.
//   void onRecognitionResult(String text) {
//     if (_isEndOfSpeech) {
//       _isEndOfSpeech = false;
//       return;
//     }
//     setState(() {
//       transcription = text;
//       _isListening = true;
//       print('recognized text is- $transcription');
//       _myController.text = transcription;
//       _myController.selection = TextSelection.fromPosition(
//           TextPosition(offset: _myController.text.length));
//     });
//   }
// // 3.
//   void onRecognitionComplete() {
//     print('Recognition Completed');
//
//     if (transcription.isNotEmpty) {
//       _isContentsPresent = true;
//       _processRequest(transcription);
//       _toggleSpeechRecognitionStatus(isSpeechStarted: false);
//     }
//   }
// }

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
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
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
        title: Text('Speech Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
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

