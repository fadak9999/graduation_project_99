
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
   











