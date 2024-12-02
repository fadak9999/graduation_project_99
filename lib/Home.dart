import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project_99/pages/account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:graduation_project_99/pages/Chat_bot/Chatbot.dart';
import 'package:graduation_project_99/pages/Speech%20to%20text/Speech_to_text.dart';
import 'package:graduation_project_99/pages/image_to_text/image_to_text.dart';
import 'package:graduation_project_99/pages/text_to_speech/text_to_speech.dart';

class Home extends StatefulWidget {
  final Function(Locale) setLocale;

  const Home({Key? key, required this.setLocale}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('languageCode') ?? 'en';
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  Future<void> _changeLanguage(Locale locale) async {
    setState(() {
      _locale = locale;
    });
    await widget.setLocale(locale);
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    // التحقق من أن _locale تم تحميله
    if (_locale == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    bool isRtl = _locale!.languageCode == 'ar';
////////////////////////////////////////////////////////////////////////////
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        //!appar
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: Container(
            margin: const EdgeInsets.all(15),
            //  height: 100,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 101, 29, 135)),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 70, 16, 99),
                  Color.fromARGB(255, 117, 57, 212),
                  Color.fromARGB(255, 70, 16, 99),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(1000),
                bottomLeft: Radius.circular(1000),
                topRight: Radius.circular(100),
                topLeft: Radius.circular(1000),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // النص والأيقونة في الجوانب
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30), // إضافة مسافة من الجانب الأيسر
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context)!.titllehome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30), // إضافة مسافة من الجانب الأيمن
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.account_circle),
                      onPressed: () async {
                        await Get.to(
                          Account(setLocale: _changeLanguage, userEmail: ''),
                        );
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //!appar
        body: ListView(
          children: [
            const SizedBox(height: 30),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                Color.fromARGB(255, 76, 0, 117),
                const Color.fromARGB(255, 133, 83, 186),
                const Color.fromARGB(255, 51, 1, 84),
              ],
              margin: const EdgeInsets.only(right: 70),
              icon: FontAwesomeIcons.comments,
              label: S.of(context)?.chatbot ?? 'Chatbot',
              onPressed: () => Get.to(const Chatbot()),
            ),
            const SizedBox(height: 50),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                Color.fromARGB(255, 76, 0, 117),
                const Color.fromARGB(255, 133, 83, 186),
                const Color.fromARGB(255, 51, 1, 84),
              ],
              margin: const EdgeInsets.only(left: 70),
              icon: FontAwesomeIcons.fileImage,
              label: S.of(context)?.text_to_imag ?? 'Image to Text',
              onPressed: () => Get.to(const image_to_text()),
            ),
            const SizedBox(height: 50),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                Color.fromARGB(255, 76, 0, 117),
                const Color.fromARGB(255, 133, 83, 186),
                const Color.fromARGB(255, 51, 1, 84),
              ],
              margin: const EdgeInsets.only(right: 70),
              icon: FontAwesomeIcons.microphone,
              label: S.of(context)?.speech_to_text ?? 'Speech to Text',
              onPressed: () => Get.to(const speech_to_text()),
            ),
            const SizedBox(height: 50),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                Color.fromARGB(255, 76, 0, 117),
                const Color.fromARGB(255, 133, 83, 186),
                const Color.fromARGB(255, 51, 1, 84),
              ],
              margin: const EdgeInsets.only(left: 70),
              icon: FontAwesomeIcons.microphoneLines,
              label: S.of(context)?.text_to_speech ?? 'Text to Speech',
              onPressed: () => Get.to(const TextToSpeech()),
            ),
            //!

            // ElevatedButton(
            //     onPressed: () {
            //       Get.to(splash());
            //     },
            //     child: Text("data"))

            //!
          ],
        ),
      ),
    );
  }

  ///;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  Widget _buildFeatureContainer({
    required BuildContext context,
    required List<Color> gradientColors,
    required EdgeInsets margin,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: margin,
      height: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: margin == const EdgeInsets.only(left: 70)
              ? const Radius.circular(100)
              : Radius.zero,
          topLeft: margin == const EdgeInsets.only(left: 70)
              ? const Radius.circular(100)
              : Radius.zero,
          bottomRight: margin == const EdgeInsets.only(right: 70)
              ? const Radius.circular(100)
              : Radius.zero,
          topRight: margin == const EdgeInsets.only(right: 70)
              ? const Radius.circular(100)
              : Radius.zero,
        ),
        border:
            Border.all(color: const Color.fromARGB(255, 119, 1, 204), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 77, 55, 87)
                .withOpacity(0.4), // زيادة الشفافية لجعل الظلال أكثر نعومة
            offset: const Offset(6, 12), // تحريك الظلال بشكل أكثر واقعية
            blurRadius: 18, // تدرج الظل بشكل أكثر نعومة
            spreadRadius: 2, // جعل الظل ينتشر بشكل أكبر
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.15), // إضافة ظل خفيف أسود لزيادة الواقعية
            offset: const Offset(-6, -12), // الظل المعاكس
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
