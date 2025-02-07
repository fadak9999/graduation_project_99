
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project_99/pages/Home.dart';
import 'package:graduation_project_99/pages/introduction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isIntroductionSeen = prefs.getBool('isIntroductionSeen') ?? false;

    // تأخير لمدة ثانيتين
    await Future.delayed(const Duration(seconds: 2));

    if (isIntroductionSeen) {
      // التنقل مباشرة للصفحة الرئيسية
      Get.off(() => Home(setLocale: (Locale locale) {}));
    } else {
      // التنقل إلى صفحة المقدمة
      Get.off(() => Introduction(
        setLocale: (Locale locale) {},
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 187, 188),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '_ Ai 99 _',
                      style: GoogleFonts.lobster(
                        fontSize: constraints.maxWidth * 0.1, // نسبة من العرض
                        color: const Color.fromARGB(255, 48, 0, 90),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Text(
                  "W e l c o m e",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.05, // نسبة من العرض
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
