// ignore_for_file: library_private_types_in_public_api
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:graduation_project_99/Firebase__/login.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:graduation_project_99/mod/ModeProvider.dart';
import 'package:graduation_project_99/mod/ModeTheme.dart';
import 'package:graduation_project_99/pages/Sections/Chat_bot/API.dart';
import 'package:graduation_project_99/pages/splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//const String GEMINI_API_KEY = 'AIzaSyDg-TmHL20iubkcKJ1L5SMB5fw6sjlgyrU';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Gemini.init(apiKey: gemini_Api_Key);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String localeCode = prefs.getString('locale') ?? 'en';

  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // يعمل فقط في وضع التطوير
      builder: (context) => ChangeNotifierProvider(
        create: (context) => ModeProvider(),
        child: MyApp(initialLocale: Locale(localeCode)),
      ),
    ),
  );

}

class MyApp extends StatefulWidget {
  final Locale initialLocale;

  // ignore: use_super_parameters
  const MyApp({Key? key, required this.initialLocale}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  void setLocale(Locale value) async {
    setState(() {
      _locale = value;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', value.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModeProvider>(
      builder: (context, modeProvider, child) {
        //
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: modeProvider.lightModeEnable
              ? ModeTheme.lightMode
              : ModeTheme.darkMode,
          locale: _locale,
          fallbackLocale: const Locale(
              'en'), // تحديد لغة افتراضية في حال كانت locale غير معينة
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          //!-----
          home: const Splash(),

          builder: (context, child) {
            return Directionality(
              textDirection: _locale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: child!,
            );
          },
          getPages: [
            GetPage(name: '/login', page: () => const login()),
          ],
        );
      },
    );
  }
}
