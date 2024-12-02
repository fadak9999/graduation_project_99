

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_99/Home.dart';
import 'package:graduation_project_99/introduction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    // الحصول على SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // التحقق إذا تم عرض المقدمة مسبقًا
    bool isIntroductionSeen = prefs.getBool('isIntroductionSeen') ?? false;

    await Future.delayed(const Duration(seconds: 2)); // تأخير لمدة ثانيتين

    if (isIntroductionSeen) {
      // التنقل مباشرة للصفحة الرئيسية
      Get.off(() => Home(setLocale: (Locale ) {  },));
    } else {
      // التنقل إلى صفحة المقدمة
      Get.off(() => introduction(
            setLocale: (Locale locale) {
              print("Locale set to: ${locale.languageCode}");
            },
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 239, 219),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text("data"),
              ),
            ),
            Text(
              "W e l c o m e",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}


