// // ignore_for_file: file_names

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project_99/Firebase__/login.dart';
// import 'package:graduation_project_99/pages/hometest.dart';
// import 'package:graduation_project_99/Home.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // ignore: camel_case_types
// class auth extends StatefulWidget {
//   const auth({super.key, required void Function(Locale value) setLocale});

//   @override
//   State<auth> createState() => _authState();
// }

// // ignore: camel_case_types
// class _authState extends State<auth> {

  

//   //! تعريف دالة setLocale
//   void setLocale(Locale value) async {
//     setState(() {
//     });
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('locale', value.languageCode);
//   }

// //!
//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Home(setLocale: setLocale);
//           } else {
//             return const login();
//           }
//         },
//       ),
//     );
//   }
// }






// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_99/Firebase__/login.dart';
import 'package:graduation_project_99/pages/hometest.dart';
import 'package:graduation_project_99/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class auth extends StatefulWidget {
  final void Function(Locale value) setLocale; // تعريف المتغير

  const auth({super.key, required this.setLocale}); // تمريره في البناء

  @override
  State<auth> createState() => _authState();
}

// ignore: camel_case_types
class _authState extends State<auth> {
  //! إعادة تعريف الوظيفة setLocale باستخدام الوظيفة الممررة
  void setLocale(Locale value) async {
    widget.setLocale(value); // استدعاء الوظيفة الممررة من الأعلى
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home(setLocale: setLocale); // تمرير الوظيفة المحدثة إلى Home
          } else {
            return const login();
          }
        },
      ),
    );
  }
}
