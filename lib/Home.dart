// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project_99/features/mod/ModeProvider.dart';
// import 'package:graduation_project_99/pages/account.dart';
// import 'package:graduation_project_99/Home.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:graduation_project_99/generated/l10n.dart';
// import 'package:graduation_project_99/pages/Chat_bot/Chatbot.dart';
// import 'package:graduation_project_99/pages/Speech%20to%20text/Speech_to_text.dart';
// import 'package:graduation_project_99/pages/image_to_text/image_to_text.dart';
// import 'package:graduation_project_99/pages/text_to_speech/text_to_speech.dart';

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
//     bool lightDarkToggle = context.watch<ModeProvider>().lightModeEnable;

//     // التحقق من أن _locale تم تحميله
//     if (_locale == null) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     bool isRtl = _locale!.languageCode == 'ar';

//     return Directionality(
//       textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
//       child: Scaffold(
//           //!=====================

//           appBar: AppBar(
//             title: Text(S.of(context)!.titllehome), // استخدام نص افتراضي
//             backgroundColor: const Color.fromARGB(255, 94, 39, 153),
//             elevation: 0,
//             actions: [
//               IconButton(
//                 color: Colors.white,
//                 icon: const Icon(Icons.account_circle), // أيقونة البروفايل
//                 onPressed: () {
//                   Get.to(Account(
//                     setLocale: widget.setLocale,
//                     userEmail: '',
//                   ));
//                 },
//               ),
//             ],
//           ),
// ////////////////////////////////////////////////////////////////////////////////////
//           body: ListView(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               //!---------------------------------\1111111111111111111111111111111
//               Container(
//                 margin: const EdgeInsets.only(right: 70),
//                 height: 130,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                       Color.fromARGB(255, 96, 53, 112), // اللون الثاني
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.circular(100),
//                     topRight: Radius.circular(100),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color.fromARGB(255, 160, 160, 157)
//                           .withOpacity(0.2), // لون الظل
//                       offset: const Offset(4, 10), // مكان الظل
//                       blurRadius: 20, // مدى انتشار الظل
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const SizedBox(width: 20), // مسافة البداية
//                     // الأيقونة
//                     IconButton(
//                       onPressed: () {
//                         Get.to(const Chatbot());
//                       },
//                       icon: const Icon(
//                         FontAwesomeIcons.comments, // نوع الأيقونة
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     // النص
//                     TextButton(
//                       onPressed: () {
//                         Get.to(const Chatbot());
//                       },
//                       child: Text(
//                         S.of(context)?.chatbot ?? 'Chatbot',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18 // تغيير اللون إلى الأبيض
//                             ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               //!----------------------------------2222222222222222222222

//               SizedBox(
//                 height: 50,
//               ),
//               //!
//               Container(
//                 margin: const EdgeInsets.only(left: 70),
//                 height: 130,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 96, 53, 112), // اللون الثاني
//                       Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(100),
//                     topLeft: Radius.circular(100),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color.fromARGB(255, 160, 160, 157)
//                           .withOpacity(0.2), // لون الظل
//                       offset: const Offset(4, 10), // مكان الظل
//                       blurRadius: 20, // مدى انتشار الظل
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const SizedBox(width: 20), // مسافة البداية
//                     // الأيقونة
//                     IconButton(
//                       onPressed: () {
//                         Get.to(const image_to_text());
//                       },
//                       icon: const Icon(
//                         FontAwesomeIcons.fileImage, // نوع الأيقونة
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     // النص
//                     TextButton(
//                       onPressed: () {
//                         Get.to(const image_to_text());
//                       },
//                       child: Text(
//                         S.of(context)?.text_to_imag ?? 'Image to Text', // النص
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               //!-------------------------------------------------------------

//               SizedBox(
//                 height: 50,
//               ),
//               //!3333333333333333333333333333333333333333333333333
//               Container(
//                 margin: const EdgeInsets.only(right: 70),
//                 height: 130,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                       Color.fromARGB(255, 96, 53, 112), // اللون الثاني4),
//                       // اللون الثاني
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.circular(100),
//                     topRight: Radius.circular(100),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color.fromARGB(255, 160, 160, 157)
//                           .withOpacity(0.2), // لون الظل
//                       offset: const Offset(4, 10), // مكان الظل
//                       blurRadius: 20, // مدى انتشار الظل
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const SizedBox(width: 20), // مسافة البداية
//                     // الأيقونة
//                     IconButton(
//                       onPressed: () {
//                         Get.to(const speech_to_text());
//                       },
//                       icon: const Icon(
//                         FontAwesomeIcons.microphone, // نوع الأيقونة
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     // النص
//                     TextButton(
//                       onPressed: () {
//                         Get.to(const speech_to_text());
//                       },
//                       child: Text(
//                         S.of(context)?.speech_to_text ??
//                             'Speech to Text', // النص
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               //!
//               SizedBox(
//                 height: 50,
//               ),
//               //!44444444444444444444444444444444444444444444444444444
//               Container(
//                 margin: const EdgeInsets.only(left: 70),
//                 height: 130,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 96, 53, 112), // اللون الثاني
//                       Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(100),
//                     topLeft: Radius.circular(100),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color.fromARGB(255, 160, 160, 157)
//                           .withOpacity(0.2), // لون الظل
//                       offset: const Offset(4, 10), // مكان الظل
//                       blurRadius: 20, // مدى انتشار الظل
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const SizedBox(width: 20), // مسافة البداية
//                     // الأيقونة
//                     IconButton(
//                       onPressed: () {
//                         Get.to(const TextToSpeech());
//                       },
//                       icon: const Icon(
//                         FontAwesomeIcons.microphoneLines, // نوع الأيقونة
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     // النص
//                     TextButton(
//                       onPressed: () {
//                         Get.to(const TextToSpeech());
//                       },
//                       child: Text(
//                         S.of(context)?.text_to_speech ??
//                             'Text to Speech', // النص
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//           // _buildBody(),
//           ),
//     );
//   }

// ///////////////////////////////////////////////////////////////////////////////////////
//   Widget _buildBody() {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Container(
//           margin: const EdgeInsets.only(top: 60, right: 10, left: 10),
//           child: Column(
//             children: [
//               Expanded(
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 170,
//                   childAspectRatio: 0.9,
//                   children: [
//                     _buildFeatureCard(
//                       color1: Colors.purple[400]!,
//                       color2: Colors.purple[900]!,
//                       icon: FontAwesomeIcons.comments,
//                       label: S.of(context)?.chatbot ?? 'Chatbot',
//                       onTap: () => Get.to(const Chatbot()),
//                     ),
//                     _buildFeatureCard(
//                       color1: Colors.blue[400]!,
//                       color2: Colors.blue[900]!,
//                       icon: FontAwesomeIcons.fileImage,
//                       label: S.of(context)?.text_to_imag ?? 'Image to Text',
//                       onTap: () => Get.to(const image_to_text()),
//                     ),
//                     _buildFeatureCard(
//                       color1: Colors.teal[400]!,
//                       color2: Colors.teal[900]!,
//                       icon: FontAwesomeIcons.microphone,
//                       label: S.of(context)?.speech_to_text ?? 'Speech to Text',
//                       onTap: () => Get.to(const speech_to_text()),
//                     ),
//                     _buildFeatureCard(
//                       color1: Colors.orange[400]!,
//                       color2: Colors.orange[900]!,
//                       icon: FontAwesomeIcons.microphoneLines,
//                       label: S.of(context)?.text_to_speech ?? 'Text to Speech',
//                       onTap: () => Get.to(const TextToSpeech()),
//                     ),
//                   ],
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     //  Get.to(Test(setLocale: (Locale ) {  },));
//                   },
//                   child: Text("home"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureCard({
//     required Color color1,
//     required Color color2,
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [color1, color2],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 40),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //////////////////////////////////////////////

//!---------------------cccccccccccccccc

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project_99/features/mod/ModeProvider.dart';
import 'package:graduation_project_99/pages/account.dart';
import 'package:provider/provider.dart';
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
    bool lightDarkToggle = context.watch<ModeProvider>().lightModeEnable;

    // التحقق من أن _locale تم تحميله
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
        appBar: AppBar(
          title: Text(S.of(context)!.titllehome),
          backgroundColor: const Color.fromARGB(255, 94, 39, 153),
          elevation: 0,
          actions: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.account_circle),
              onPressed: () async {
                await Get.to(
                    Account(setLocale: _changeLanguage, userEmail: ''));
                // عند العودة من صفحة الإعدادات يتم تحديث الواجهة
                setState(() {});
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 30),
            _buildFeatureContainer(
              context: context,
              gradientColors: [
                const Color.fromARGB(255, 94, 39, 153),
                const Color.fromARGB(255, 96, 53, 112),
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
                const Color.fromARGB(255, 96, 53, 112),
                const Color.fromARGB(255, 94, 39, 153),
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
                const Color.fromARGB(255, 94, 39, 153),
                const Color.fromARGB(255, 96, 53, 112),
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
                const Color.fromARGB(255, 96, 53, 112),
                const Color.fromARGB(255, 94, 39, 153),
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

  // Widget _buildFeatureContainer({
  //   required BuildContext context,
  //   required List<Color> gradientColors,
  //   required EdgeInsets margin,
  //   required IconData icon,
  //   required String label,
  //   required VoidCallback onPressed,
  // }) {
  //   return Container(
  //     margin: margin,
  //     height: 130,
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: gradientColors,
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //       ),
  //       borderRadius: BorderRadius.only(
  //         bottomLeft: margin == const EdgeInsets.only(left: 70)
  //             ? const Radius.circular(100)
  //             : Radius.zero,
  //         topLeft: margin == const EdgeInsets.only(left: 70)
  //             ? const Radius.circular(100)
  //             : Radius.zero,
  //         bottomRight: margin == const EdgeInsets.only(right: 70)
  //             ? const Radius.circular(100)
  //             : Radius.zero,
  //         topRight: margin == const EdgeInsets.only(right: 70)
  //             ? const Radius.circular(100)
  //             : Radius.zero,
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: const Color.fromARGB(255, 160, 160, 157).withOpacity(0.2),
  //           offset: const Offset(4, 10),
  //           blurRadius: 20,
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         const SizedBox(width: 20),
  //         IconButton(
  //           onPressed: onPressed,
  //           icon: Icon(
  //             icon,
  //             color: Colors.white,
  //             size: 40,
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         TextButton(
  //           onPressed: onPressed,
  //           child: Text(
  //             label,
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}


//!---------------------cccccccccccccccc

























































// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:graduation_project_99/generated/l10n.dart';
// import 'package:graduation_project_99/pages/account.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   get setLocale => null;

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     /////////////////////////////////////////////////
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context)!.titllehome), // استخدام نص افتراضي
//         backgroundColor: const Color.fromARGB(255, 94, 39, 153),
//         elevation: 0,
//         actions: [
//           IconButton(
//             color: Colors.white,
//             icon: const Icon(Icons.account_circle), // أيقونة البروفايل
//             onPressed: () {
//               Get.to(Account(
//                 setLocale: widget.setLocale,
//                 userEmail: '',
//               ));
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           //!---------------------------------\
//           Container(
//             margin: const EdgeInsets.only(right: 70),
//             height: 130,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                   Color.fromARGB(255, 214, 160, 234), // اللون الثاني
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(100),
//                 topRight: Radius.circular(100),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(255, 160, 160, 157)
//                       .withOpacity(0.2), // لون الظل
//                   offset: const Offset(4, 10), // مكان الظل
//                   blurRadius: 20, // مدى انتشار الظل
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(width: 20), // مسافة البداية
//                 // الأيقونة
//                 IconButton(
//                   onPressed: () {
//                     print("Icon pressed!");
//                   },
//                   icon: const Icon(
//                     Icons.chat_sharp, // نوع الأيقونة
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 // النص
//                 TextButton(
//                   onPressed: () {
//                     print("Text pressed!");
//                   },
//                   child: const Text(
//                     "chat bot", // النص
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Container(
//           //   margin: EdgeInsets.only(right: 70),
//           //   height: 130,
//           //   decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.only(
//           //           bottomRight: Radius.circular(100),
//           //           topRight: Radius.circular(100)),
//           //       color: const Color.fromARGB(255, 115, 2, 152)),
//           //   child: Center(child: Text("11111111111")),
//           //   // color: Colors.purpleAccent,
//           // ),
//           //!----------------------------------2222222222222222222222

//           SizedBox(
//             height: 50,
//           ),
//           //!
//           Container(
//             margin: const EdgeInsets.only(left: 70),
//             height: 130,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                   Color.fromARGB(255, 214, 160, 234), // اللون الثاني
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(100),
//                 topLeft: Radius.circular(100),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(255, 160, 160, 157)
//                       .withOpacity(0.2), // لون الظل
//                   offset: const Offset(4, 10), // مكان الظل
//                   blurRadius: 20, // مدى انتشار الظل
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(width: 20), // مسافة البداية
//                 // الأيقونة
//                 IconButton(
//                   onPressed: () {
//                     print("Icon pressed!");
//                   },
//                   icon: const Icon(
//                     Icons.mic, // نوع الأيقونة
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 // النص
//                 TextButton(
//                   onPressed: () {
//                     print("22222");
//                   },
//                   child: const Text(
//                     "22222222", // النص
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           //!-------------------------------------------------------------

//           SizedBox(
//             height: 50,
//           ),
//           //!3333333333333333333333333333333333333333333333333
//           Container(
//             margin: const EdgeInsets.only(right: 70),
//             height: 130,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                   Color.fromARGB(255, 214, 160, 234), // اللون الثاني
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(100),
//                 topRight: Radius.circular(100),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(255, 160, 160, 157)
//                       .withOpacity(0.2), // لون الظل
//                   offset: const Offset(4, 10), // مكان الظل
//                   blurRadius: 20, // مدى انتشار الظل
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(width: 20), // مسافة البداية
//                 // الأيقونة
//                 IconButton(
//                   onPressed: () {
//                     print("Icon pressed!");
//                   },
//                   icon: const Icon(
//                     Icons.image, // نوع الأيقونة
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 // النص
//                 TextButton(
//                   onPressed: () {
//                     print("Text pressed!");
//                   },
//                   child: const Text(
//                     "imag", // النص
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           //!
//           SizedBox(
//             height: 50,
//           ),
//           //!44444444444444444444444444444444444444444444444444444
//           Container(
//             margin: const EdgeInsets.only(left: 70),
//             height: 130,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 94, 39, 153), // اللون الأول
//                   Color.fromARGB(255, 214, 160, 234), // اللون الثاني
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(100),
//                 topLeft: Radius.circular(100),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(255, 160, 160, 157)
//                       .withOpacity(0.2), // لون الظل
//                   offset: const Offset(4, 10), // مكان الظل
//                   blurRadius: 20, // مدى انتشار الظل
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(width: 20), // مسافة البداية
//                 // الأيقونة
//                 IconButton(
//                   onPressed: () {
//                     print("Icon pressed!");
//                   },
//                   icon: const Icon(
//                     Icons.mic, // نوع الأيقونة
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 // النص
//                 TextButton(
//                   onPressed: () {
//                     print("22222");
//                   },
//                   child: const Text(
//                     "33333333", // النص
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           //!
//         ],
//       ),
//     );
//   }
// }
