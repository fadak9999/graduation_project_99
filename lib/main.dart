


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduation_project_99/Firebase__/Ayth.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:graduation_project_99/features/mod/ModeProvider.dart';
import 'package:graduation_project_99/features/mod/ModeTheme.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




const String GEMINI_API_KEY = 'your_api_key_here';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Gemini.init(apiKey: GEMINI_API_KEY);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String localeCode = prefs.getString('locale') ?? 'en';

  runApp(
    ChangeNotifierProvider(
      create: (context) => ModeProvider(),
      child: MyApp(initialLocale: Locale(localeCode)),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Locale initialLocale;

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
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: modeProvider.lightModeEnable
              ? ModeTheme.lightMode
              : ModeTheme.darkMode,
          locale: _locale,
          fallbackLocale: Locale('en'), // تحديد لغة افتراضية في حال كانت locale غير معينة
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: auth(setLocale: setLocale), // بدء التطبيق من auth وتمرير setLocale
          builder: (context, child) {
            return Directionality(
              textDirection: _locale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: child!,
            );
          },
        );
      },
    );
  }
}
