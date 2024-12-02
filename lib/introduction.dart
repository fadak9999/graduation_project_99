// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project_99/Firebase__/Auth.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

// class introduction extends StatefulWidget {
//   final void Function(Locale) setLocale; // استقبال الوظيفة في البناء

//   const introduction({super.key, required this.setLocale});

//   @override
//   State<introduction> createState() => _introductionState();
// }

// class _introductionState extends State<introduction> {
//   // صفحات LiquidSwipe
//   late final pages = [
//     Container(
//       color: const Color.fromARGB(255, 241, 188, 31),
//       child: const Center(child: Text("LiquidSwipe")),
//     ),
//     Container(
//       color: const Color.fromARGB(255, 197, 168, 210),
//     ),
//     Container(
//       color: const Color.fromARGB(255, 66, 0, 87),
//       child: Center(
//         child: TextButton(
//           onPressed: () {
//             // استدعاء auth وتمرير setLocale
//             Get.off(auth(setLocale: widget.setLocale));
//           },
//           child: const Text("Log in"),
//         ),
//       ),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LiquidSwipe(
//         pages: pages,
//         enableSideReveal: true, // المسطرة في الجانب
//         enableLoop: false, // منع التكرار
//         slideIconWidget: const Icon(Icons.arrow_back_ios_new_outlined),
//         positionSlideIcon: 0.5,
//         waveType: WaveType.liquidReveal,
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/Firebase__/Auth.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class introduction extends StatefulWidget {
  final void Function(Locale) setLocale;

  const introduction({super.key, required this.setLocale});

  @override
  State<introduction> createState() => _introductionState();
}

class _introductionState extends State<introduction> {
  late final pages = [
    Container(
      color: const Color.fromARGB(255, 241, 188, 31),
      child: const Center(child: Text("LiquidSwipe")),
    ),
    Container(
      color: const Color.fromARGB(255, 197, 168, 210),
    ),
    Container(
      color: const Color.fromARGB(255, 66, 0, 87),
      child: Center(
        child: TextButton(
          onPressed: () async {
            // تحديث حالة المقدمة في SharedPreferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isIntroductionSeen', true);

            // الانتقال إلى صفحة تسجيل الدخول
            Get.off(() => auth(setLocale: widget.setLocale));
          },
          child: const Text("Log in"),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableSideReveal: true,
        enableLoop: false,
        slideIconWidget: const Icon(Icons.arrow_back_ios_new_outlined),
        positionSlideIcon: 0.5,
        waveType: WaveType.liquidReveal,
      ),
    );
  }
}
