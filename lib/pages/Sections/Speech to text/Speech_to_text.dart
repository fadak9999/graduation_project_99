// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:permission_handler/permission_handler.dart';

// class SpeechToTextPage extends StatefulWidget {
//   const SpeechToTextPage({super.key});

//   @override
//   State<SpeechToTextPage> createState() => _SpeechToTextPageState();
// }

// class _SpeechToTextPageState extends State<SpeechToTextPage> {
//   final SpeechToText _speechToText = SpeechToText();
//   bool _speechEnabled = false;
//   String _wordsSpoken = "";
//   double _confidenceLevel = 0;
//   String _selectedLanguage = 'en_US';

//   @override
//   void initState() {
//     super.initState();
//     initSpeech();
//   }

//   Future<void> initSpeech() async {
//     var status = await Permission.microphone.request();

//     if (status.isGranted) {
//       _speechEnabled = await _speechToText.initialize(debugLogging: true);
//       if (!_speechEnabled) {
//         setState(() {
//           _wordsSpoken = "Speech recognition is not available on this device.";
//         });
//       }
//     } else if (status.isPermanentlyDenied) {
//       _showPermissionDialog(
//           "تم حظر الوصول إلى الميكروفون. يرجى السماح بذلك من إعدادات التطبيق.");
//     } else if (status.isDenied) {
//       setState(() {
//         _wordsSpoken = "Access to microphone is required for speech recognition.";
//       });
//     }
//     setState(() {});
//   }

//   Future<void> _startListening() async {
//     if (!_speechEnabled) {
//       setState(() {
//         _wordsSpoken = "Speech recognition is not initialized properly.";
//       });
//       return;
//     }

//     await _speechToText.listen(
//       onResult: _onSpeechResult,
//       listenFor: const Duration(minutes: 1),
//       pauseFor: const Duration(seconds: 10),
//       partialResults: true,  // Enable partial results
//       localeId: _selectedLanguage,
//       onSoundLevelChange: (level) {},
//     );
//     setState(() {
//       _confidenceLevel = 0;
//     });
//   }

//   Future<void> _stopListening() async {
//     await _speechToText.stop();
//     setState(() {});
//   }

//   void _onSpeechResult(result) {
//     setState(() {
//       _wordsSpoken = result.recognizedWords;
//       _confidenceLevel = result.confidence;
//     });
//   }

//   void _showPermissionDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text(
//             'Permission Required',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           content: Text(
//             message,
//             style: const TextStyle(fontSize: 16),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 openAppSettings();
//               },
//               child: const Text(
//                 'Open Settings',
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text(
//           'Speech Recognition Demo',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               _buildInfoCard(),
//               const SizedBox(height: 20),
//               _buildLanguageSelector(),
//               const SizedBox(height: 20),
//               _buildSpeechResult(),
//               if (_speechToText.isNotListening && _confidenceLevel > 0)
//                 _buildConfidenceIndicator(),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _speechToText.isListening ? _stopListening : _startListening,
//         label: Text(_speechToText.isListening ? 'Stop Listening' : 'Start Listening'),
//         icon: Icon(_speechToText.isListening ? Icons.mic_off : Icons.mic),
//         backgroundColor: Colors.deepPurple,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }

//   Widget _buildInfoCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       elevation: 5,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Text(
//           _speechToText.isListening
//               ? "Listening... Speak now."
//               : _speechEnabled
//                   ? "Tap the microphone to start listening..."
//                   : _wordsSpoken.isNotEmpty
//                       ? _wordsSpoken
//                       : "Speech recognition not available.",
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w400,
//             color: Colors.grey[700],
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageSelector() {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.language, color: Colors.deepPurple),
//             const SizedBox(width: 10),
//             Text(
//               'Select Language:',
//               style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//             ),
//             const SizedBox(width: 10),
//             DropdownButton<String>(
//               value: _selectedLanguage,
//               underline: Container(),
//               items: const [
//                 DropdownMenuItem(
//                   value: 'ar_SA',
//                   child: Text('العربية'),
//                 ),
//                 DropdownMenuItem(
//                   value: 'en_US',
//                   child: Text('English'),
//                 ),
//               ],
//               onChanged: (value) {
//                 setState(() {
//                   _selectedLanguage = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSpeechResult() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       child: Card(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 3,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Text(
//               _wordsSpoken.isEmpty ? "Your speech will appear here..." : _wordsSpoken,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildConfidenceIndicator() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 80),
//       child: Card(
//         color: Colors.deepPurple[50],
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 3,
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Text(
//               "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepPurple,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//!2

// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:permission_handler/permission_handler.dart';

// class SpeechToTextPage extends StatefulWidget {
//   const SpeechToTextPage({super.key});

//   @override
//   State<SpeechToTextPage> createState() => _SpeechToTextPageState();
// }

// class _SpeechToTextPageState extends State<SpeechToTextPage> {
//   final SpeechToText _speechToText = SpeechToText();
//   bool _speechEnabled = false;
//   String _wordsSpoken = "Initializing speech recognition...";
//   double _confidenceLevel = 0;
//   String _selectedLanguage = 'en_US';

//   @override
//   void initState() {
//     super.initState();
//     initSpeech();
//   }

//   Future<void> initSpeech() async {
//     var status = await Permission.microphone.request();

//     if (status.isGranted) {
//       _speechEnabled = await _speechToText.initialize(
//         onError: (error) {
//           print("Speech recognition error: $error");
//         },
//         debugLogging: true,
//       );
//       if (!_speechEnabled) {
//         setState(() {
//           _wordsSpoken = "Speech recognition is not available on this device.";
//         });
//       }
//     } else if (status.isPermanentlyDenied) {
//       _showPermissionDialog(
//         "تم حظر الوصول إلى الميكروفون. يرجى السماح بذلك من إعدادات التطبيق.",
//       );
//     } else if (status.isDenied) {
//       setState(() {
//         _wordsSpoken = "Access to microphone is required for speech recognition.";
//       });
//     }
//     setState(() {});
//   }

//   Future<void> _startListening() async {
//     if (!_speechEnabled) {
//       setState(() {
//         _wordsSpoken = "Speech recognition is not initialized properly.";
//       });
//       return;
//     }

//     await _speechToText.listen(
//       onResult: _onSpeechResult,
//       listenFor: const Duration(minutes: 1),
//       pauseFor: const Duration(seconds: 10),
//       partialResults: true,
//       localeId: _selectedLanguage,
//       onSoundLevelChange: (level) {
//         print("Sound level: $level");
//       },
//     );
//     setState(() {
//       _confidenceLevel = 0;
//     });
//   }

//   Future<void> _stopListening() async {
//     await _speechToText.stop();
//     setState(() {});
//   }

//   void _onSpeechResult(result) {
//     setState(() {
//       _wordsSpoken = result.recognizedWords;
//       _confidenceLevel = result.confidence;
//     });
//   }

//   void _showPermissionDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text(
//             'Permission Required',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           content: Text(
//             message,
//             style: const TextStyle(fontSize: 16),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 openAppSettings();
//               },
//               child: const Text(
//                 'Open Settings',
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text(
//           'Speech Recognition Demo',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               _buildInfoCard(),
//               const SizedBox(height: 20),
//               _buildLanguageSelector(),
//               const SizedBox(height: 20),
//               _buildSpeechResult(),
//               if (_speechToText.isNotListening && _confidenceLevel > 0)
//                 _buildConfidenceIndicator(),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _speechToText.isListening ? _stopListening : _startListening,
//         label: Text(_speechToText.isListening ? 'Stop Listening' : 'Start Listening'),
//         icon: Icon(_speechToText.isListening ? Icons.mic_off : Icons.mic),
//         backgroundColor: Colors.deepPurple,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }

//   Widget _buildInfoCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       elevation: 5,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Text(
//           _speechToText.isListening
//               ? "Listening... Speak now."
//               : _speechEnabled
//                   ? "Tap the microphone to start listening..."
//                   : _wordsSpoken.isNotEmpty
//                       ? _wordsSpoken
//                       : "Speech recognition not available.",
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w400,
//             color: Colors.grey[700],
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageSelector() {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.language, color: Colors.deepPurple),
//             const SizedBox(width: 10),
//             Text(
//               'Select Language:',
//               style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//             ),
//             const SizedBox(width: 10),
//             DropdownButton<String>(
//               value: _selectedLanguage,
//               underline: Container(),
//               items: const [
//                 DropdownMenuItem(
//                   value: 'ar_SA',
//                   child: Text('العربية'),
//                 ),
//                 DropdownMenuItem(
//                   value: 'en_US',
//                   child: Text('English'),
//                 ),
//               ],
//               onChanged: (value) {
//                 setState(() {
//                   _selectedLanguage = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSpeechResult() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       child: Card(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 3,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Text(
//               _wordsSpoken.isEmpty ? "Your speech will appear here..." : _wordsSpoken,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildConfidenceIndicator() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 80),
//       child: Card(
//         color: Colors.deepPurple[50],
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 3,
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Text(
//               "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepPurple,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//!3
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = "Press the button to start listening...";
  double _confidenceLevel = 0;
  String _selectedLanguage = 'en_US';

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      _speechEnabled = await _speechToText.initialize(
        onError: (error) {
          debugPrint("Speech recognition error: $error");
        },
        debugLogging: false,
      );
    } else {
      setState(() {
        _wordsSpoken = "Microphone permission is required to use this feature.";
      });
    }
    setState(() {});
  }

  Future<void> _startListening() async {
    if (!_speechEnabled) {
      setState(() {
        _wordsSpoken = "Speech recognition is not initialized properly.";
      });
      return;
    }

    await _speechToText.listen(
      onResult: _onSpeechResult,
      localeId: _selectedLanguage,
    );
    setState(() {});
  }

  Future<void> _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = result.recognizedWords;
      _confidenceLevel = result.confidence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 81, 1, 135),
        title: const Text("Speech Recognition"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(0, 254, 254, 254),
              Color.fromARGB(0, 63, 81, 181)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSpeechResult(),
              _buildLanguageSelector(),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _speechToText.isListening ? const Color.fromARGB(255, 248, 115, 255) : Colors.deepPurple,
          boxShadow: [
            if (_speechToText.isListening)
              BoxShadow(
                color: const Color.fromARGB(255, 120, 0, 211).withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 5,
              ),
          ],
        ),
        child: FloatingActionButton(
          onPressed:
              _speechToText.isListening ? _stopListening : _startListening,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Icon(
            _speechToText.isListening ? Icons.mic : Icons.mic_none,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSpeechResult() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        _wordsSpoken.isEmpty ? "Your speech will appear here..." : _wordsSpoken,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Language",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedLanguage,
              underline: Container(),
              items: const [
                DropdownMenuItem(value: 'en_US', child: Text("English")),
                DropdownMenuItem(value: 'ar_SA', child: Text("العربية")),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
