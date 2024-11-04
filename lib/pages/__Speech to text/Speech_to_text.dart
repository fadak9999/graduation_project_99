import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';

class speech_to_text extends StatefulWidget {
  const speech_to_text({super.key});

  @override
  State<speech_to_text> createState() => _speech_to_textState();
}

class _speech_to_textState extends State<speech_to_text> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0;
  String _selectedLanguage = 'en_US';

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      _speechEnabled = await _speechToText.initialize(debugLogging: true);
    }
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: Duration(minutes: 1),
      pauseFor: Duration(seconds: 10),
      partialResults: true,
      localeId: _selectedLanguage,
      onSoundLevelChange: (level) {
        print("Sound level: $level");
      },
    );
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Speech Recognition Demo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildInfoCard(),
            const SizedBox(height: 20),
            _buildLanguageSelector(),
            const SizedBox(height: 20),
            _buildSpeechResult(),
            if (_speechToText.isNotListening && _confidenceLevel > 0)
              _buildConfidenceIndicator(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        label: Text(_speechToText.isListening ? 'Stop Listening' : 'Start Listening'),
        icon: Icon(_speechToText.isListening ? Icons.mic_off : Icons.mic),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildInfoCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          _speechToText.isListening
              ? "Listening... Speak now."
              : _speechEnabled
                  ? "Tap the microphone to start listening..."
                  : "Speech recognition not available.",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.language, color: Colors.deepPurple),
              const SizedBox(width: 10),
              Text(
                'Select Language:',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: _selectedLanguage,
                underline: Container(),
                items: const [
                  DropdownMenuItem(
                    value: 'ar_SA',
                    child: Text('العربية'),
                  ),
                  DropdownMenuItem(
                    value: 'en_US',
                    child: Text('English'),
                  ),
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
      ),
    );
  }

  Widget _buildSpeechResult() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Text(
                _wordsSpoken.isEmpty ? "Your speech will appear here..." : _wordsSpoken,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfidenceIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Card(
        color: Colors.deepPurple[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}