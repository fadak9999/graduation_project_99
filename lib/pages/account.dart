import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project_99/features/mod/widgets/switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/features/mod/ModeProvider.dart';

class Account extends StatefulWidget {
  final Function(Locale) setLocale;
  final String userEmail;

  const Account({Key? key, required this.setLocale, required this.userEmail})
      : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Locale? _locale;
  File? _profileImage;
  String? _userName;

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('languageCode') ?? 'en';
    String? savedName = prefs.getString('userName');
    String? imagePath = prefs.getString('profileImage');

    setState(() {
      _locale = Locale(languageCode);
      _userName = savedName ?? 'Your Name';
      if (imagePath != null && File(imagePath).existsSync()) {
        _profileImage = File(imagePath);
      }
    });

    _nameController.text = _userName!;
  }

  Future<void> _saveProfileImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', path);
  }

  Future<void> _saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  Future<void> _changeLanguage(Locale locale) async {
    setState(() {
      _locale = locale;
    });
    await widget.setLocale(locale);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery); // اختيار من المعرض

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      await _saveProfileImage(pickedFile.path);
    }
  }

  Future<void> _logout() async {
    // تنفيذ عملية تسجيل الخروج (حذف بيانات المستخدم إذا لزم)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // حذف جميع البيانات المحفوظة
    // في صفحة تسجيل الخروج
    Get.toNamed('/login');

    //Navigator.pushReplacementNamed(context, '/login'); // توجيه المستخدم لصفحة تسجيل الدخول
  }

  @override
  Widget build(BuildContext context) {
    bool lightDarkToggle = context.watch<ModeProvider>().lightModeEnable;

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
      /////////////////////////////////////////////////////////////////////////////
      child: Scaffold(
        appBar: AppBar(
          title: Text(isRtl ? 'الإعدادات' : 'Settings'),
          backgroundColor: Color.fromARGB(255, 70, 16, 99),
          elevation: 0,
        ),
        body: ListView(
          children: [
            // صورة الملف الشخصي واسم المستخدم والبريد الإلكتروني
            Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(10000),
              //       bottomRight: Radius.circular(10000)),
              //   color: const Color.fromARGB(255, 84, 23, 134),
              // ),

              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10000),
                  bottomRight: Radius.circular(10000),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter, // بداية التدرج
                  end: Alignment.bottomCenter, // نهاية التدرج
                  colors: [
                    Color.fromARGB(255, 70, 16, 99),
                    Color.fromARGB(255, 133, 91, 201),
                    Color.fromARGB(255, 70, 16, 99),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 96, 63, 106)
                        .withOpacity(0.4), // لون الظل مع الشفافية
                    spreadRadius: 5, // مدى الانتشار
                    blurRadius: 10, // مدى التشويش
                    offset: const Offset(0, 5), // الاتجاه (x, y)
                  ),
                ],
                // border: Border.all(color: Colors.black),
              ),

              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : const AssetImage('assets/pr.png') as ImageProvider,
                      backgroundColor: const Color.fromARGB(255, 224, 219, 219),
                      child: _profileImage == null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 90, left: 65),
                              child: const Icon(Icons.add_a_photo,
                                  size: 35,
                                  color: Color.fromARGB(255, 39, 1, 81)),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: isRtl
                          ? '           اسم المستخدم'
                          : '        Username :',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(209, 255, 241, 241)),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      setState(() {
                        _userName = value;
                      });
                      _saveUserName(value);
                    },
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.userEmail, // البريد الإلكتروني
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            const Divider(color: Color.fromARGB(255, 22, 1, 31)),
//??????????????
            ListTile(
              title: Text(
                isRtl ? 'تغيير اللغة' : 'Change Language',
                style: const TextStyle(fontSize: 16),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // النص على الجهة اليسرى
                  Text(
                    'English', // نص الجهة اليسرى
                    style: const TextStyle(
                      color: Colors.black, // يمكنك تغيير اللون حسب التصميم
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 10), // المسافة بين النص والسويتش
                  GestureDetector(
                    onTap: () {
                      bool newValue = _locale!.languageCode != 'ar';
                      _changeLanguage(newValue ? Locale('ar') : Locale('en'));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 75, // عرض السويتش
                      height: 40, // ارتفاع السويتش
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: _locale!.languageCode == 'ar'
                            ? const Color.fromARGB(255, 84, 1, 126)
                            : const Color.fromARGB(255, 212, 163, 245),
                      ),
                      child: Align(
                        alignment: _locale!.languageCode == 'ar'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // المسافة بين السويتش والنص
                  // النص على الجهة اليمنى
                  Text(
                    'عربي', // نص الجهة اليمنى
                    style: const TextStyle(
                      color: Colors.black, // يمكنك تغيير اللون حسب التصميم
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Color.fromARGB(255, 22, 1, 31)),

            // الوضع الليلي/النهاري
            // Light/Dark Mode switch
            //?========================================================================
            ListTile(
              title: Text(
                isRtl ? 'الوضع' : ' Mode',
                style: const TextStyle(fontSize: 16),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(1.0),
                child: LightDarkSwitch(
                  value: lightDarkToggle,
                  onChanged: (value) {
                    context.read<ModeProvider>().chaneMode();
                  },
                ),
              ),
            ),

            // SizedBox(
            //   child: AnimatedContainer(
            //     duration: const Duration(milliseconds: 100),
            //     // color: lightDarkToggle
            //     //     ? const Color.fromARGB(0, 228, 8, 8)
            //     //     : const Color.fromARGB(0, 55, 71, 79),
            //     child:
            //         //  Center(
            //         //  child:
            //         Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: LightDarkSwitch(
            //         value: lightDarkToggle,
            //         onChanged: (value) {
            //           context.read<ModeProvider>().chaneMode();
            //         },
            //       ),
            //     ),
            //     //),
            //   ),
            // ),

            //?============================================================
            // ListTile(
            //   title: Text(
            //     lightDarkToggle
            //         ? (isRtl ? 'الوضع الداكن' : 'Dark Mode')
            //         : (isRtl ? 'الوضع الفاتح' : 'Light Mode'),
            //     style: const TextStyle(fontSize: 16),
            //   ),
            //   trailing: Switch(
            //     value: lightDarkToggle,
            //     onChanged: (value) {
            //       context.read<ModeProvider>().chaneMode();
            //     },
            //   ),
            // ),
            const Divider(color: Color.fromARGB(255, 22, 1, 31)),

            // زر تسجيل الخروج
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                isRtl ? 'تسجيل الخروج' : 'Logout',
                style: const TextStyle(fontSize: 16),
              ),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
