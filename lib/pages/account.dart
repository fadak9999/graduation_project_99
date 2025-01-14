// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:graduation_project_99/mod/ModeProvider.dart';
// import 'package:graduation_project_99/mod/features/mod/widgets/switch.dart';

// class Account extends StatefulWidget {
//   final Function(Locale) setLocale;
//   final String userEmail;

//   const Account({super.key, required this.setLocale, required this.userEmail});

//   @override
//   State<Account> createState() => _AccountState();
// }

// class _AccountState extends State<Account> {
//   Locale? _locale;
//   File? _profileImage;
//   String? _userName;

//   final TextEditingController _nameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   Future<void> _loadSettings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String languageCode = prefs.getString('languageCode') ?? 'en';
//     String? savedName = prefs.getString('userName');
//     String? imagePath = prefs.getString('profileImage');

//     debugPrint('Loaded UserName: $savedName'); // للتحقق من القراءة

//     setState(() {
//       _locale = Locale(languageCode);
//       _userName = savedName ?? 'Your Name';
//       if (imagePath != null && File(imagePath).existsSync()) {
//         _profileImage = File(imagePath);
//       }
//     });

//     _nameController.text = _userName!;
//   }

//   Future<void> _saveProfileImage(String path) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('profileImage', path);
//   }

//   Future<void> _saveUserName(String name) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userName', name);
//   }

//   Future<void> _changeLanguage(Locale locale) async {
//     setState(() {
//       _locale = locale;
//     });
//     await widget.setLocale(locale);

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('languageCode', locale.languageCode);
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.gallery); // اختيار من المعرض

//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//       await _saveProfileImage(pickedFile.path);
//     }
//   }

//   Future<void> _logout() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear(); // حذف جميع البيانات المحفوظة
//     Get.toNamed('/login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool lightDarkToggle = context.watch<ModeProvider>().lightModeEnable;

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
//         appBar: AppBar(
//           title: Text(isRtl ? 'الإعدادات' : 'Settings'),
//           backgroundColor: const Color.fromARGB(255, 70, 16, 99),
//           elevation: 0,
//         ),
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             // Adjust layout based on screen width
//             double width = constraints.maxWidth;
//             double padding = width < 600 ? 16 : 32;

//             return ListView(
//               children: [
//                 // Profile Image, Username, and Email
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(10000),
//                       bottomRight: Radius.circular(10000),
//                     ),
//                     gradient: const LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Color.fromARGB(255, 70, 16, 99),
//                         Color.fromARGB(255, 133, 91, 201),
//                         Color.fromARGB(255, 70, 16, 99),
//                       ],
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color.fromARGB(255, 96, 63, 106)
//                             .withOpacity(0.4),
//                         spreadRadius: 5,
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   padding: EdgeInsets.all(padding),
//                   child: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: _pickImage,
//                         child: CircleAvatar(
//                           radius: 60,
//                           backgroundImage: _profileImage != null
//                               ? FileImage(_profileImage!)
//                               : const AssetImage('assets/pr.png')
//                                   as ImageProvider,
//                           backgroundColor: const Color.fromARGB(255, 224, 219, 219),
//                           child: _profileImage == null
//                               ? const Padding(
//                                   padding: EdgeInsets.only(top: 90, left: 65),
//                                   child: Icon(Icons.add_a_photo,
//                                       size: 35,
//                                       color: Color.fromARGB(255, 39, 1, 81)),
//                                 )
//                               : null,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       TextField(
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                           labelText: isRtl ? '           اسم المستخدم' : '        Username :',
//                           labelStyle: const TextStyle(
//                               color: Color.fromARGB(209, 255, 241, 241)),
//                           border: InputBorder.none,
//                         ),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                         onChanged: (value) async {
//                           _userName = value;
//                           await _saveUserName(value);
//                           debugPrint('Saved UserName: $value');
//                         },
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         widget.userEmail,
//                         style: const TextStyle(color: Colors.white70, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 100),
//                 const Divider(color: Color.fromARGB(255, 22, 1, 31)),

//                 // Change Language
//                 ListTile(
//                   title: Text(
//                     isRtl ? 'تغيير اللغة' : 'Change Language',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text(
//                         'English',
//                         style: TextStyle(color: Colors.black, fontSize: 14),
//                       ),
//                       const SizedBox(width: 10),
//                       GestureDetector(
//                         onTap: () {
//                           bool newValue = _locale!.languageCode != 'ar';
//                           _changeLanguage(newValue ? const Locale('ar') : const Locale('en'));
//                         },
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           width: 75,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: _locale!.languageCode == 'ar'
//                                 ? const Color.fromARGB(255, 84, 1, 126)
//                                 : const Color.fromARGB(255, 212, 163, 245),
//                           ),
//                           child: Align(
//                             alignment: _locale!.languageCode == 'ar'
//                                 ? Alignment.centerRight
//                                 : Alignment.centerLeft,
//                             child: Container(
//                               width: 25,
//                               height: 25,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       const Text(
//                         'عربي',
//                         style: TextStyle(color: Colors.black, fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const Divider(color: Color.fromARGB(255, 22, 1, 31)),

//                 // Light/Dark Mode switch
//                 ListTile(
//                   title: Text(
//                     isRtl ? 'الوضع' : ' Mode',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   trailing: LightDarkSwitch(
//                     value: lightDarkToggle,
//                     onChanged: (value) {
//                       context.read<ModeProvider>().chaneMode();
//                     },
//                   ),
//                 ),
//                 const Divider(color: Color.fromARGB(255, 22, 1, 31)),

//                 // Logout Button
//                 ListTile(
//                   leading: const Icon(Icons.logout),
//                   title: Text(
//                     isRtl ? 'تسجيل الخروج' : 'Logout',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   onTap: _logout,
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/mod/ModeProvider.dart';
import 'package:graduation_project_99/mod/features/mod/widgets/switch.dart';

class Account extends StatefulWidget {
  final Function(Locale) setLocale;
  final String userEmail;

  const Account({super.key, required this.setLocale, required this.userEmail});

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
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      await _saveProfileImage(pickedFile.path);
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.toNamed('/login');
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isRtl ? 'الإعدادات' : 'Settings',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF4A148C),
          elevation: 4,
          shadowColor: Colors.black45,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double padding = width < 600 ? 16 : 32;

            return ListView(
              children: [
                // Profile Image, Username, and Email
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF4A148C),
                        Color(0xFF7E57C2),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: padding, vertical: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : const AssetImage('assets/pr.png')
                                  as ImageProvider,
                          backgroundColor: const Color(0xFFF3E5F5),
                          child: _profileImage == null
                              ? const Icon(Icons.add_a_photo,
                                  size: 30, color: Color(0xFF4A148C))
                              : null,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: isRtl ? 'اسم المستخدم' : 'Username',
                          labelStyle: const TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (value) async {
                          _userName = value;
                          await _saveUserName(value);
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.userEmail,
                        style: const TextStyle(color: Colors.white60, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Change Language
                ListTile(
                  title: Text(
                    isRtl ? 'تغيير اللغة' : 'Change Language',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'English',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          bool newValue = _locale!.languageCode != 'ar';
                          _changeLanguage(newValue ? const Locale('ar') : const Locale('en'));
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 75,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: _locale!.languageCode == 'ar'
                                ? const Color(0xFF4A148C)
                                : const Color(0xFFD1C4E9),
                          ),
                          child: Align(
                            alignment: _locale!.languageCode == 'ar'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
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
                      const SizedBox(width: 10),
                      const Text(
                        'عربي',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Color(0xFFE0E0E0)),

                // Light/Dark Mode switch
                ListTile(
                  title: Text(
                    isRtl ? 'الوضع' : 'Mode',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  trailing: LightDarkSwitch(
                    value: lightDarkToggle,
                    onChanged: (value) {
                      context.read<ModeProvider>().chaneMode();
                    },
                  ),
                ),
                const Divider(thickness: 1, color: Color(0xFFE0E0E0)),

                // Logout Button
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: Text(
                    isRtl ? 'تسجيل الخروج' : 'Logout',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  onTap: _logout,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
