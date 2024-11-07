

// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class TextToSpeech extends StatefulWidget {
//   const TextToSpeech({super.key});

//   @override
//   State<TextToSpeech> createState() => _TextToSpeechState();
// }

// class _TextToSpeechState extends State<TextToSpeech> {
//   final FlutterTts _flutterTts = FlutterTts();
//   final TextEditingController _textController = TextEditingController();

//   List<Map> _voices = [];
//   Map? _currentVoice;
//   bool _isEnglish = true;

//   @override
//   void initState() {
//     super.initState();
//     initTTS();
//   }

//   void initTTS() async {
//     _flutterTts.setProgressHandler((text, start, end, word) {
//       setState(() {});
//     });
//     try {
//       var data = await _flutterTts.getVoices;
//       if (data.isNotEmpty) {
//         List<Map> voices = List<Map>.from(data);
//         setState(() {
//           _voices = voices
//               .where((voice) =>
//                   voice["name"].contains("en") || voice["name"].contains("ar"))
//               .toList();
//           if (_voices.isNotEmpty) {
//             _currentVoice = _voices.first;
//             setVoice(_currentVoice!);
//           } else {
//             // ignore: avoid_print
//             print("No voices available");
//           }
//         });
//       } else {
//         // ignore: avoid_print
//         print("No voices returned");
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print("Error getting voices: $e");
//     }
//   }

//   void setVoice(Map voice) {
//     _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
//   }

//   Future<void> _speakText() async {
//     if (_textController.text.isNotEmpty) {
//       try {
//         await _flutterTts.speak(_textController.text);
//       } catch (e) {
//         // ignore: avoid_print
//         print("Error: $e");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(
//         backgroundColor: const Color(0xFF6200EE),
//         title: Text(
//           _isEnglish ? "Text-to-Speech" : "النص إلى كلام",
//           style: const TextStyle(color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.language, color: Colors.white),
//             onPressed: () {
//               setState(() {
//                 _isEnglish = !_isEnglish;
//                 _currentVoice = _voices.firstWhere((voice) => _isEnglish
//                     ? voice["locale"].startsWith("en")
//                     : voice["locale"].startsWith("ar"));
//                 setVoice(_currentVoice!);
//               });
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   _isEnglish ? "Enter text to speak" : "أدخل النص للتحدث",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: _textController,
//                   maxLines: 3,
//                   style: const TextStyle(fontSize: 18),
//                   decoration: InputDecoration(
//                     hintText:
//                         _isEnglish ? "Type something..." : "اكتب شيئًا...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: const BorderSide(
//                         color: Colors.blue,
//                         width: 2.0, 
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _speakText,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF6200EE),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   child: Text(
//                     _isEnglish ? "Speak" : "تحدث",
//                     style: const TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 _speakerSelector(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _speakerSelector() {
//     return DropdownButton<Map>(
//       dropdownColor: Colors.blue[200],
//       iconEnabledColor: Colors.blue[200],
//       value: _currentVoice,
//       isExpanded: true,
//       items: _voices
//           .map(
//             (voice) => DropdownMenuItem(
//               value: voice,
//               child: Text(
//                 voice["name"],
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ),
//           )
//           .toList(),
//       onChanged: (value) {
//         setState(() {
//           _currentVoice = value;
//           setVoice(_currentVoice!);
//         });
//       },
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _textController = TextEditingController();

  List<Map> _voices = [];
  Map? _currentVoice;

  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() async {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {});
    });
    try {
      var data = await _flutterTts.getVoices;
      if (data.isNotEmpty) {
        List<Map> voices = List<Map>.from(data);
        setState(() {
          _voices = voices
              .where((voice) =>
                  voice["name"].contains("en") || voice["name"].contains("ar"))
              .toList();
          if (_voices.isNotEmpty) {
            _currentVoice = _voices.first;  // تحديد الصوت الأول عند تحميل الأصوات
            setVoice(_currentVoice!);
          } else {
            // ignore: avoid_print
            print("No voices available");
          }
        });
      } else {
        // ignore: avoid_print
        print("No voices returned");
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error getting voices: $e");
    }
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  Future<void> _speakText() async {
    if (_textController.text.isNotEmpty && _currentVoice != null) {
      try {
        await _flutterTts.speak(_textController.text);
      } catch (e) {
        // ignore: avoid_print
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: const Text(
          "Text-to-Speech", // ثابت كعنوان
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Enter text to speak", // نص ثابت بالإنجليزية
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _textController,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: "Type something...", // نص ثابت بالإنجليزية
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _speakText,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6200EE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Speak", // نص ثابت بالإنجليزية
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                _speakerSelector(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _speakerSelector() {
    return DropdownButton<Map>(
      dropdownColor: Colors.blue[200],
      iconEnabledColor: Colors.blue[200],
      value: _currentVoice,
      isExpanded: true,
      items: _voices
          .map(
            (voice) => DropdownMenuItem(
              value: voice,
              child: Text(
                voice["name"],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          _currentVoice = value;
          setVoice(_currentVoice!);
        });
      },
    );
  }
}
