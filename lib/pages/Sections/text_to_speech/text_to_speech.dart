import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:graduation_project_99/generated/l10n.dart';

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
            _currentVoice =
                _voices.first; // تحديد الصوت الأول عند تحميل الأصوات
            setVoice(_currentVoice!);
          } else {
            print("No voices available");
          }
        });
      } else {
        print("No voices returned");
      }
    } catch (e) {
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
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 0, 109),
        title: Text(
          S.of(context)!.text_to_speech,
          style: const TextStyle(
            color: Colors.white,
          ),
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
                  S.of(context)!.Enter, // استخدام المفتاح Enter
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 115, 1, 180),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _textController,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: "Type something...",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 132, 132, 132),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 89, 2, 136),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _speakText,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 94, 1, 137),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    S.of(context)!.speak, // استخدام المفتاح Enter
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 223, 223, 223),
                    ),
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
      dropdownColor: const Color.fromARGB(255, 116, 2, 153),
      iconEnabledColor: const Color.fromARGB(255, 192, 2, 255),
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
