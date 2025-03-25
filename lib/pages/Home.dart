// // ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project_99/pages/account.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:graduation_project_99/generated/l10n.dart';
// import 'package:graduation_project_99/pages/Sections/Chat_bot/Chatbot.dart';
// import 'package:graduation_project_99/pages/Sections/Speech%20to%20text/Speech_to_text.dart';
// import 'package:graduation_project_99/pages/Sections/image_to_text/image_to_text.dart';
// import 'package:graduation_project_99/pages/Sections/text_to_speech/text_to_speech.dart';

// class Home extends StatefulWidget {
//   final Function(Locale) setLocale;

//   const Home({Key? key, required this.setLocale}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Locale? _locale;

//   @override
//   void initState() {
//     super.initState();
//     _loadLanguage();
//   }

//   Future<void> _loadLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String languageCode = prefs.getString('languageCode') ?? 'en';
//     setState(() {
//       _locale = Locale(languageCode);
//     });
//   }

//   Future<void> _changeLanguage(Locale locale) async {
//     setState(() {
//       _locale = locale;
//     });
//     await widget.setLocale(locale);
//     Get.updateLocale(locale);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_locale == null) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     bool isRtl = _locale!.languageCode == 'ar';
// ////////////////////////////////////////////////////////////////////
//     return Directionality(
//       textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size(
//             double.infinity,
//             MediaQuery.of(context).size.height * 0.15,
//           ),
//           child: Container(
//             margin: const EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               border: Border.all(color: const Color.fromARGB(255, 101, 29, 135)),
//               gradient: const LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 70, 16, 99),
//                   Color.fromARGB(255, 117, 57, 212),
//                   Color.fromARGB(255, 70, 16, 99),
//                 ],
//               ),
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(1000),
//                 bottomLeft: Radius.circular(1000),
//                 topRight: Radius.circular(100),
//                 topLeft: Radius.circular(1000),
//               ),
//             ),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         S.of(context)!.titllehome,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: MediaQuery.of(context).size.width * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 30),
//                     child: IconButton(
//                       color: const Color.fromARGB(255, 255, 255, 255),
//                       icon: const Icon(Icons.account_circle),
//                       iconSize: 40,
//                       onPressed: () async {
//                         await Get.to(
//                           Account(setLocale: _changeLanguage, userEmail: ''),
//                         );
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: ListView(
//           children: [
//             const SizedBox(height: 30),
//             _buildFeatureContainer(
//               context: context,
//               gradientColors: [
//                 const Color.fromARGB(255, 76, 0, 117),
//                 const Color.fromARGB(255, 133, 83, 186),
//                 const Color.fromARGB(255, 51, 1, 84),
//               ],
//               margin: const EdgeInsets.only(right: 70),
//               icon: FontAwesomeIcons.comments,
//               label: S.of(context)?.chatbot ?? 'Chatbot',
//               onPressed: () => Get.to(const Chatbot()),
//             ),
//             const SizedBox(height: 50),
//             _buildFeatureContainer(
//               context: context,
//               gradientColors: [
//                 const Color.fromARGB(255, 76, 0, 117),
//                 const Color.fromARGB(255, 133, 83, 186),
//                 const Color.fromARGB(255, 51, 1, 84),
//               ],
//               margin: const EdgeInsets.only(left: 70),
//               icon: FontAwesomeIcons.fileImage,
//               label: S.of(context)?.text_to_imag ?? 'Image to Text',
//               onPressed: () => Get.to(const ImageToText()),
//             ),
//             const SizedBox(height: 50),
//             _buildFeatureContainer(
//               context: context,
//               gradientColors: [
//                 const Color.fromARGB(255, 76, 0, 117),
//                 const Color.fromARGB(255, 133, 83, 186),
//                 const Color.fromARGB(255, 51, 1, 84),
//               ],
//               margin: const EdgeInsets.only(right: 70),
//               icon: FontAwesomeIcons.microphone,
//               label: S.of(context)?.speech_to_text ?? 'Speech to Text',
//               onPressed: () => Get.to(const SpeechToTextPage()),
//             ),
//             const SizedBox(height: 50),
//             _buildFeatureContainer(
//               context: context,
//               gradientColors: [
//                 const Color.fromARGB(255, 76, 0, 117),
//                 const Color.fromARGB(255, 133, 83, 186),
//                 const Color.fromARGB(255, 51, 1, 84),
//               ],
//               margin: const EdgeInsets.only(left: 70),
//               icon: FontAwesomeIcons.microphoneLines,
//               label: S.of(context)?.text_to_speech ?? 'Text to Speech',
//               onPressed: () => Get.to(const TextToSpeech()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureContainer({
//     required BuildContext context,
//     required List<Color> gradientColors,
//     required EdgeInsets margin,
//     required IconData icon,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       margin: margin,
//       height: 130,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gradientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: margin == const EdgeInsets.only(left: 70)
//               ? const Radius.circular(100)
//               : Radius.zero,
//           topLeft: margin == const EdgeInsets.only(left: 70)
//               ? const Radius.circular(100)
//               : Radius.zero,
//           bottomRight: margin == const EdgeInsets.only(right: 70)
//               ? const Radius.circular(100)
//               : Radius.zero,
//           topRight: margin == const EdgeInsets.only(right: 70)
//               ? const Radius.circular(100)
//               : Radius.zero,
//         ),
//         border: Border.all(color: const Color.fromARGB(255, 119, 1, 204), width: 2),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             offset: const Offset(6, 6),
//             blurRadius: 20,
//             spreadRadius: 3,
//           ),
//           BoxShadow(
//             color: Colors.white.withOpacity(0.15),
//             offset: const Offset(-6, -6),
//             blurRadius: 15,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(width: 20),
//           IconButton(
//             onPressed: onPressed,
//             icon: Icon(
//               icon,
//               color: Colors.white,
//               size: MediaQuery.of(context).size.width * 0.1,
//             ),
//           ),
//           const SizedBox(width: 10),
//           TextButton(
//             onPressed: onPressed,
//             child: Text(
//               label,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: MediaQuery.of(context).size.width * 0.05,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }























// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project_99/pages/account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:graduation_project_99/pages/Sections/Chat_bot/Chatbot.dart';
import 'package:graduation_project_99/pages/Sections/Speech%20to%20text/Speech_to_text.dart';
import 'package:graduation_project_99/pages/Sections/image_to_text/image_to_text.dart';
import 'package:graduation_project_99/pages/Sections/text_to_speech/text_to_speech.dart';

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
    Get.updateLocale(_locale!); // تحديث اللغة باستخدام Get
  }

  Future<void> _changeLanguage(Locale locale) async {
    setState(() {
      _locale = locale;
    });

    // حفظ اللغة في SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);

    // تحديث اللغة باستخدام Get
    await widget.setLocale(locale);
    Get.updateLocale(locale); // تأكد من تحديث اللغة على مستوى التطبيق بأكمله
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    bool isRtl = _locale!.languageCode == 'ar';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            MediaQuery.of(context).size.height * 0.15,
          ),
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 101, 29, 135)),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context)!.titllehome,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: IconButton(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      icon: const Icon(Icons.account_circle),
                      iconSize: 40,
                      onPressed: () async {
                        await Get.to(
                          Account(setLocale: _changeLanguage, userEmail: ''),
                        );
                        setState(() {}); // إعادة تحميل الصفحة بعد التبديل
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 30),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                const Color.fromARGB(255, 76, 0, 117),
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
                const Color.fromARGB(255, 76, 0, 117),
                const Color.fromARGB(255, 133, 83, 186),
                const Color.fromARGB(255, 51, 1, 84),
              ],
              margin: const EdgeInsets.only(left: 70),
              icon: FontAwesomeIcons.fileImage,
              label: S.of(context)?.text_to_imag ?? 'Image to Text',
              onPressed: () => Get.to(const ImageToText()),
            ),
            const SizedBox(height: 50),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                const Color.fromARGB(255, 76, 0, 117),
                const Color.fromARGB(255, 133, 83, 186),
                const Color.fromARGB(255, 51, 1, 84),
              ],
              margin: const EdgeInsets.only(right: 70),
              icon: FontAwesomeIcons.microphone,
              label: S.of(context)?.speech_to_text ?? 'Speech to Text',
              onPressed: () => Get.to(const SpeechToTextPage()),
            ),
            const SizedBox(height: 50),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                const Color.fromARGB(255, 76, 0, 117),
                const Color.fromARGB(255, 133, 83, 186),
                const Color.fromARGB(255, 51, 1, 84),
              ],
              margin: const EdgeInsets.only(left: 70),
              icon: FontAwesomeIcons.microphoneLines,
              label: S.of(context)?.text_to_speech ?? 'Text to Speech',
              onPressed: () => Get.to(const TextToSpeech()),
            ),
          ],
        ),
      ),
    );
  }

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
        border: Border.all(color: const Color.fromARGB(255, 119, 1, 204), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(6, 6),
            blurRadius: 20,
            spreadRadius: 3,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.15),
            offset: const Offset(-6, -6),
            blurRadius: 15,
            spreadRadius: 2,
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
              size: MediaQuery.of(context).size.width * 0.1,
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
