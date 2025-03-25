import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/Firebase__/Auth.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

// ignore: camel_case_types
class Introduction extends StatefulWidget {
  final void Function(Locale) setLocale;

  const Introduction({super.key, required this.setLocale});

  @override
  State<Introduction> createState() => _IntroductionState();
}

// ignore: camel_case_types
class _IntroductionState extends State<Introduction> {
  late final pages = [
    // الصفحة الأولى
    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 129, 3, 255),
            Color.fromARGB(255, 54, 0, 109),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the :',
                  style: GoogleFonts.lobster(
                    fontSize: constraints.maxWidth * 0.08, // نسبة من العرض
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  '_ Ai 99 _',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: constraints.maxWidth * 0.1, // نسبة من العرض
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 186, 169, 201),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    ),
    // الصفحة الثانية
    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 109, 2, 197),
            Color.fromARGB(255, 37, 0, 67),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.3, // نسبة من الارتفاع
                  child: const Image(image: AssetImage("assets/ai.png")),
                ),
                const SizedBox(height: 20),
                Text(
                  'Possibility to chat ',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: constraints.maxWidth * 0.08, // نسبة من العرض
                    color: const Color.fromARGB(255, 209, 206, 210),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'with Ai',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: constraints.maxWidth * 0.08, // نسبة من العرض
                    color: const Color.fromARGB(255, 209, 206, 210),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    ),
    // الصفحات الأخرى (بنفس الفكرة)222
    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
               Color.fromARGB(255, 154, 53, 255),
            Color.fromARGB(255, 54, 0, 109),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.3, // نسبة من الارتفاع
                  child: const Image(image: AssetImage("assets/text.png")),
                ),
                const SizedBox(height: 20),
                Text(
                  'Convert text to voice and vice versa',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: constraints.maxWidth * 0.08, // نسبة من العرض
                    color: const Color.fromARGB(255, 209, 206, 210),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    ),
    //...

    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
           Color.fromARGB(255, 109, 2, 197),
            Color.fromARGB(255, 37, 0, 67),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.3, // نسبة من الارتفاع
                  child: const Image(image: AssetImage("assets/imag.png")),
                ),
                const SizedBox(height: 20),
                Text(
                  'Extract text from image',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: constraints.maxWidth * 0.08, // نسبة من العرض
                    color: const Color.fromARGB(255, 209, 206, 210),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    ),

    //.........
    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 154, 53, 255),
            Color.fromARGB(255, 54, 0, 109),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Now log in to the application :',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: constraints.maxWidth * 0.07, // نسبة من العرض
                    color: const Color.fromARGB(255, 254, 251, 254),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Text(
                  'to enjoy its features :-)',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: constraints.maxWidth * 0.07, // نسبة من العرض
                    color: const Color.fromARGB(255, 254, 251, 254),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isIntroductionSeen', true);
                    Get.off(() => auth(setLocale: widget.setLocale));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    "Log in",
                    style: GoogleFonts.roboto(
                      fontSize: constraints.maxWidth * 0.07, // نسبة من العرض
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
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
