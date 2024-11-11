import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project_99/features/mod/ModeProvider.dart';
import 'package:graduation_project_99/features/mod/widgets/switch.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:graduation_project_99/pages/_Chatbot__/Chatbot.dart';
import 'package:graduation_project_99/pages/__Speech%20to%20text/Speech_to_text.dart';
import 'package:graduation_project_99/pages/__image_to_text/image_to_text.dart';
import 'package:graduation_project_99/pages/__text_to_speech/text_to_speech.dart';

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
        //!=====================

        // drawer: Drawer(
        //   backgroundColor: const Color.fromARGB(255, 146, 135, 153),
        //   child: Scaffold(
        //     appBar: AppBar(),
        //     body: Column(
        //       children: [
        //         Center(
        //           child: SwitchListTile(
        //             title: const Text('Change Language'),
        //             value: _locale!.languageCode == 'ar',
        //             onChanged: (bool value) {
        //               _changeLanguage(value ? Locale('ar') : Locale('en'));
        //             },
        //           ),
        //         ),
        //         SizedBox(
        //           height: 100,
        //           child: AnimatedContainer(
        //             duration: const Duration(milliseconds: 300),
        //             color: lightDarkToggle
        //                 ? Colors.blue[100]
        //                 : Colors.blueGrey[800],
        //             child: Center(
        //               child: LightDarkSwitch(
        //                 value: lightDarkToggle,
        //                 onChanged: (value) {
        //                   context.read<ModeProvider>().chaneMode();
        //                 },
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 146, 135, 153),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // User profile section

              Container(
                height: 200,
                color: const Color.fromARGB(255, 84, 23, 134),
              ),
              // const UserAccountsDrawerHeader(
              //   accountName: Text(
              //     'User Name', // هنا ضع اسم المستخدم
              //     style: TextStyle(
              //         fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              //   accountEmail: Text(
              //     'user@example.com', // هنا ضع بريد المستخدم
              //     style: TextStyle(fontSize: 16),
              //   ),
              //   currentAccountPicture: CircleAvatar(
              //     backgroundImage: NetworkImage(
              //         'https://example.com/profile.jpg'), // هنا ضع رابط صورة المستخدم
              //     backgroundColor: Colors.transparent,
              //   ),
              //   decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 94, 39, 153), // لون الخلفية
              //   ),
              // ),
              // Language change switch
              ListTile(
                title: const Text('Change Language'),
                trailing: Switch(
                  value: _locale!.languageCode == 'ar',
                  onChanged: (bool value) {
                    _changeLanguage(value ? Locale('ar') : Locale('en'));
                  },
                ),
              ),
              const Divider(),
              // Light/Dark Mode switch
              //?========================================================================

              SizedBox(
                //   height: 80,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  color: lightDarkToggle
                      ? const Color.fromARGB(0, 174, 174, 174)
                      : const Color.fromARGB(0, 55, 71, 79),
                  child: Center(
                    child: LightDarkSwitch(
                      value: lightDarkToggle,
                      onChanged: (value) {
                        context.read<ModeProvider>().chaneMode();
                      },
                    ),
                  ),
                ),
              ),

              //?========================================================================
              const Divider(),
              // Other options
              ListTile(
                leading: const Icon(Icons.chat, color: Colors.black),
                title: Text(S.of(context)?.chatbot ?? 'Chatbot'),
                onTap: () => Get.to(const Chatbot()),
              ),
              ListTile(
                leading: const Icon(Icons.image, color: Colors.black),
                title: Text(S.of(context)?.text_to_imag ?? 'Image to Text'),
                onTap: () => Get.to(const image_to_text()),
              ),
              ListTile(
                leading: const Icon(Icons.mic, color: Colors.black),
                title: Text(S.of(context)?.speech_to_text ?? 'Speech to Text'),
                onTap: () => Get.to(const speech_to_text()),
              ),
              ListTile(
                leading: const Icon(Icons.volume_up, color: Colors.black),
                title: Text(S.of(context)?.text_to_speech ?? 'Text to Speech'),
                onTap: () => Get.to(const TextToSpeech()),
              ),
              const Divider(),
              // Additional options can be added here
            ],
          ),
        ),

        //!=============================================
        // appBar: AppBar(
        //   title: Text(S.of(context)!.titllehome), // استخدام نص افتراضي
        //   backgroundColor: const Color.fromARGB(255, 94, 39, 153),
        //   elevation: 0,
        //   actionsIconTheme: Icon(Icons.abc),
        // ),

        appBar: AppBar(
          title: Text(S.of(context)!.titllehome), // استخدام نص افتراضي
          backgroundColor: const Color.fromARGB(255, 94, 39, 153),
          elevation: 0,
          actions: [
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.account_circle), // أيقونة البروفايل
              onPressed: () {
                // إضافة الفعل الذي سيحدث عند الضغط على الأيقونة (مثل فتح صفحة الملف الشخصي)
              },
            ),
          ],
        ),

        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          margin: const EdgeInsets.only(top: 60, right: 10, left: 10),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 170,
                  childAspectRatio: 0.9,
                  children: [
                    _buildFeatureCard(
                      color1: Colors.purple[400]!,
                      color2: Colors.purple[900]!,
                      icon: FontAwesomeIcons.comments,
                      label: S.of(context)?.chatbot ?? 'Chatbot',
                      onTap: () => Get.to(const Chatbot()),
                    ),
                    _buildFeatureCard(
                      color1: Colors.blue[400]!,
                      color2: Colors.blue[900]!,
                      icon: FontAwesomeIcons.fileImage,
                      label: S.of(context)?.text_to_imag ?? 'Image to Text',
                      onTap: () => Get.to(const image_to_text()),
                    ),
                    _buildFeatureCard(
                      color1: Colors.teal[400]!,
                      color2: Colors.teal[900]!,
                      icon: FontAwesomeIcons.microphone,
                      label: S.of(context)?.speech_to_text ?? 'Speech to Text',
                      onTap: () => Get.to(const speech_to_text()),
                    ),
                    _buildFeatureCard(
                      color1: Colors.orange[400]!,
                      color2: Colors.orange[900]!,
                      icon: FontAwesomeIcons.microphoneLines,
                      label: S.of(context)?.text_to_speech ?? 'Text to Speech',
                      onTap: () => Get.to(const TextToSpeech()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required Color color1,
    required Color color2,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
