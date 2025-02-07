// import 'package:flutter/material.dart';
// import 'package:graduation_project_99/generated/l10n.dart';
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
//   String _wordsSpoken = "Press the button to start listening...";
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
//           debugPrint("Speech recognition error: $error");
//         },
//         debugLogging: false,
//       );
//     } else {
//       setState(() {
//         _wordsSpoken = "Microphone permission is required to use this feature.";
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
//       localeId: _selectedLanguage,
//     );
//     setState(() {});
//   }

//   Future<void> _stopListening() async {
//     await _speechToText.stop();
//     setState(() {});
//   }

//   void _onSpeechResult(result) {
//     setState(() {
//       _wordsSpoken = result.recognizedWords;
//     });
//   }
// ////////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//   elevation: 0,
//   backgroundColor: const Color.fromARGB(255, 81, 1, 135),
//   title: Text(
//     S.of(context)!.speech_to_text,
//     style: const TextStyle(
//       color: Colors.white,
//     ),
//   ),
//   centerTitle: true,
// ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(0, 254, 254, 254),
//               Color.fromARGB(0, 63, 81, 181)
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildSpeechResult(),
//               _buildLanguageSelector(),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: _speechToText.isListening ? const Color.fromARGB(255, 248, 115, 255) : Colors.deepPurple,
//           boxShadow: [
//             if (_speechToText.isListening)
//               BoxShadow(
//                 color: const Color.fromARGB(255, 120, 0, 211).withOpacity(0.5),
//                 blurRadius: 20,
//                 spreadRadius: 5,
//               ),
//           ],
//         ),
//         child: FloatingActionButton(
//           onPressed:
//               _speechToText.isListening ? _stopListening : _startListening,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           child: Icon(
//             _speechToText.isListening ? Icons.mic : Icons.mic_none,
//             size: 30,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }

//   Widget _buildSpeechResult() {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       margin: const EdgeInsets.symmetric(horizontal: 24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Text(
//         _wordsSpoken.isEmpty ? "Your speech will appear here..." : _wordsSpoken,
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w500,
//           color: Colors.black87,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget _buildLanguageSelector() {
//     return Card(
//       elevation: 6,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//            Text(
//   S.of(context)!.Language, // استخدام المفتاح Language للترجمة
//   style: const TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//   ),
// ),
//             DropdownButton<String>(
//               value: _selectedLanguage,
//               underline: Container(),
//               items: const [
//                 DropdownMenuItem(value: 'en_US', child: Text("English")),
//                 DropdownMenuItem(value: 'ar_SA', child: Text("العربية")),
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
// }

//!//////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:graduation_project_99/generated/l10n.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'dart:ui';

// class SpeechToTextPage extends StatefulWidget {
//   const SpeechToTextPage({super.key});

//   @override
//   State<SpeechToTextPage> createState() => _SpeechToTextPageState();
// }

// class _SpeechToTextPageState extends State<SpeechToTextPage>
//     with SingleTickerProviderStateMixin {
//   final SpeechToText _speechToText = SpeechToText();
//   bool _speechEnabled = false;
//   String _wordsSpoken = "اضغط على الميكروفون للتحدث...";

//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     initSpeech();

//     // تحريك الزر عند الاستماع
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//       lowerBound: 0.9,
//       upperBound: 1.2,
//     );
//     _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
//   }

//   Future<void> initSpeech() async {
//     var status = await Permission.microphone.request();
//     if (status.isGranted) {
//       _speechEnabled = await _speechToText.initialize(
//         onError: (error) {
//           debugPrint("خطأ في التعرف على الصوت: $error");
//         },
//         debugLogging: false,
//       );
//     } else {
//       setState(() {
//         _wordsSpoken = "يجب السماح باستخدام الميكروفون لاستخدام هذه الميزة.";
//       });
//     }
//     setState(() {});
//   }

//   Future<void> _startListening() async {
//     if (!_speechEnabled) {
//       setState(() {
//         _wordsSpoken = "التعرف على الصوت غير مهيأ بشكل صحيح.";
//       });
//       return;
//     }

//     await _speechToText.listen(
//       onResult: _onSpeechResult,
//     );

//     _controller.repeat(reverse: true); // تشغيل الأنيميشن
//     setState(() {});
//   }

//   Future<void> _stopListening() async {
//     await _speechToText.stop();
//     _controller.stop(); // إيقاف الأنيميشن
//     setState(() {});
//   }

//   void _onSpeechResult(result) {
//     setState(() {
//       _wordsSpoken = result.recognizedWords;
//     });
//   }

// ////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true, // يجعل الخلفية تمتد تحت الـ AppBar
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color.fromARGB(255, 139, 94, 199),
//         title: Text(
//           S.of(context)!.speech_to_text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           _buildBackground(), // خلفية متحركة مع Blur
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildSpeechResult(),
//             ],
//           ),
//         ],
//       ),
//       floatingActionButton: ScaleTransition(
//         scale: _animation,
//         child: FloatingActionButton(
//           onPressed:
//               _speechToText.isListening ? _stopListening : _startListening,
//           backgroundColor: _speechToText.isListening
//               ? const Color.fromARGB(255, 208, 100, 255).withOpacity(0.8)
//               : Colors.deepPurpleAccent,
//           elevation: 10,
//           child: Icon(
//             _speechToText.isListening ? Icons.mic : Icons.mic_none,
//             size: 30,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }

//   /// ✅ تصميم خلفية أنيقة مع تأثير التمويه (Blur)
//   Widget _buildBackground() {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A11CB),
//             Color.fromARGB(255, 218, 218, 218),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           color: Colors.black.withOpacity(0.2),
//         ),
//       ),
//     );
//   }

//   /// ✅ تصميم صندوق عرض النص مع تأثيرات ناعمة
//   Widget _buildSpeechResult() {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         margin: const EdgeInsets.symmetric(horizontal: 30),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 15,
//               spreadRadius: 3,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Text(
//               _wordsSpoken.isEmpty ? "سيظهر النص المنطوق هنا..." : _wordsSpoken,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
//             AnimatedOpacity(
//               duration: const Duration(milliseconds: 500),
//               opacity: _speechToText.isListening ? 1 : 0,
//               child: const Text(
//                 "يتم الاستماع الآن...",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Color.fromARGB(255, 137, 1, 179),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//!3






import 'package:flutter/material.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui';

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage>
    with SingleTickerProviderStateMixin {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = ""; // سيتم ضبطه من الترجمة

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initSpeech();

    // تحريك الزر عند الاستماع
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.9,
      upperBound: 1.2,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);

    // ضبط النص الافتراضي حسب اللغة المختارة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _wordsSpoken = S.of(context)!.press_mic_to_speak;
      });
    });
  }

  Future<void> initSpeech() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      _speechEnabled = await _speechToText.initialize(
        onError: (error) {
          debugPrint("خطأ في التعرف على الصوت: $error");
        },
        debugLogging: false,
      );
    } else {
      setState(() {
        _wordsSpoken = S.of(context)!.microphone_permission_required;
      });
    }
    setState(() {});
  }

  Future<void> _startListening() async {
    if (!_speechEnabled) {
      setState(() {
        _wordsSpoken = S.of(context)!.speech_not_initialized;
      });
      return;
    }

    await _speechToText.listen(
      onResult: _onSpeechResult,
    );

    _controller.repeat(reverse: true); // تشغيل الأنيميشن
    setState(() {});
  }

  Future<void> _stopListening() async {
    await _speechToText.stop();
    _controller.stop(); // إيقاف الأنيميشن
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = result.recognizedWords;
    });
  }

////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // يجعل الخلفية تمتد تحت الـ AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 139, 94, 199),
        title: Text(
          S.of(context)!.speech_to_text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _buildBackground(), // خلفية متحركة مع Blur
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSpeechResult(),
            ],
          ),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed:
              _speechToText.isListening ? _stopListening : _startListening,
          backgroundColor: _speechToText.isListening
              ? const Color.fromARGB(255, 208, 100, 255).withOpacity(0.8)
              : Colors.deepPurpleAccent,
          elevation: 10,
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

  /// ✅ تصميم خلفية أنيقة مع تأثير التمويه (Blur)
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6A11CB),
            Color.fromARGB(255, 218, 218, 218),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }

  /// ✅ تصميم صندوق عرض النص مع تأثيرات ناعمة
  Widget _buildSpeechResult() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              spreadRadius: 3,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              _wordsSpoken.isEmpty
                  ? S.of(context)!.speech_will_appear_here
                  : _wordsSpoken,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _speechToText.isListening ? 1 : 0,
              child: Text(
                S.of(context)!.listening_now,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 137, 1, 179),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
