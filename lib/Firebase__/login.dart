// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:graduation_project_99/Firebase__/signup.dart';
// import 'package:graduation_project_99/pages/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // ignore: camel_case_types
// class login extends StatefulWidget {
//   const login({super.key});

//   @override
//   State<login> createState() => _loginState();
// }

// // ignore: camel_case_types
// class _loginState extends State<login> {
//   void setLocale(Locale value) async {
//     setState(() {});
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('locale', value.languageCode);
//   }

//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   bool _obscureText = true;

//   Future signInWithGoogle() async {
//     final googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) {
//       // ignore: use_build_context_synchronously
//       return ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('You have not specified an account')));
//     }
//     final googleAuth = await googleUser.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }

// //?================

//   Future login() async {
//     if (check_enter_user()) {
//       try {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _email.text.trim(),
//           password: _password.text.trim(),
//         );
//         Get.off(() => Home(setLocale: setLocale));
//       } on FirebaseAuthException catch (e) {
//         String message;

//         if (e.code == 'user-not-found') {
//           message = 'No account found with this email. Please sign up first.';
//         } else if (e.code == 'wrong-password') {
//           message = 'Incorrect password. Please try again.';
//         } else {
//           message = 'An error occurred. Please try again later.';
//         }

//         // عرض مربع الحوار
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               backgroundColor:
//                   const Color.fromARGB(255, 50, 0, 75), // لون خلفية بنفسجي غامق
//               title: const Text(
//                 "Login Error",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               content: Text(
//                 message,
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 230, 230, 230), // لون النص أبيض
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text(
//                     "OK",
//                     style: TextStyle(
//                       color:
//                           Color.fromARGB(255, 148, 0, 211), // لون بنفسجي فاتح
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } else {
//       showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return const SizedBox(
//             height: 300,
//             width: double.infinity,
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   "لم تقم بإضافة البريد الإلكتروني أو كلمة المرور. حاول مجددًا.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     }
//   }

// //?================
// //!
//   // Future login() async {
//   //   if (check_enter_user()) {
//   //     await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //         email: _email.text.trim(), password: _password.text.trim());
//   //     Get.off(() => Home(setLocale: setLocale));
//   //   } else {
//   //     return showModalBottomSheet(
//   //         context: context,
//   //         builder: (context) {
//   //           return const SizedBox(
//   //             height: 300,
//   //             width: double.infinity,
//   //             child: Expanded(
//   //               child: Center(
//   //                 child: Padding(
//   //                   padding: EdgeInsets.all(10),
//   //                   child: Text(
//   //                     "لم تقم باضافه البريد الالكتروني او كلمة المرور حاول مجددا ",
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //           );
//   //         });
//   //   }
//   // }
// //!
//   // ignore: non_constant_identifier_names
//   bool check_enter_user() {
//     if (_email.text.trim() != "" && _password.text.trim() != "") {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _email.dispose();
//     _password.dispose();
//   }

//   // ignore: non_constant_identifier_names
//   void go_to_signUp() {
//     Get.off(const signup());
//   }

//   @override
//   Widget build(BuildContext context) {
//     //!_____________________________________________________
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 255, 255, 255),
//               Color.fromARGB(255, 171, 124, 205),
//               Color.fromARGB(255, 82, 0, 153),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: ListView(
//           children: [
//             const SizedBox(height: 80),
//             const Center(
//               child: Text(
//                 "⁓ Fae ⁓",
//                 style: TextStyle(
//                   fontSize: 35,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   fontWeight: FontWeight.bold,
//                   shadows: [
//                     Shadow(
//                       color: Color.fromARGB(255, 82, 1, 104), // لون الظل الأزرق
//                       offset: Offset(0, 6), // موضع الظل
//                       blurRadius: 13.0, // مستوى التمويه
//                     ),
//                   ],
//                 ),
//               ),

//               //     child: Text(
//               //   "⁓ Fae ⁓",
//               //   style: TextStyle(
//               //       fontSize: 35,
//               //       color: Color.fromARGB(255, 152, 53, 239),
//               //       fontWeight: FontWeight.bold),
//               // ),
//             ),
//             const SizedBox(height: 135),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 30),
//                   // حقل البريد الإلكتروني
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(25),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.15),
//                             offset: const Offset(4, 4),
//                             blurRadius: 15,
//                             spreadRadius: 1,
//                           ),
//                           BoxShadow(
//                             color: Colors.white.withOpacity(0.8),
//                             offset: const Offset(-4, -4),
//                             blurRadius: 15,
//                             spreadRadius: 1,
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextField(
//                           controller: _email,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             icon: Icon(Icons.person_outline),
//                             hintText: "E-mail",
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   // حقل كلمة المرور
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(25),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.15),
//                             offset: const Offset(4, 4),
//                             blurRadius: 15,
//                             spreadRadius: 1,
//                           ),
//                           BoxShadow(
//                             color: Colors.white.withOpacity(0.8),
//                             offset: const Offset(-4, -4),
//                             blurRadius: 15,
//                             spreadRadius: 1,
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextField(
//                           controller: _password,
//                           obscureText: _obscureText,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             icon: const Icon(Icons.lock_outline),
//                             hintText: "Password",
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _obscureText
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _obscureText = !_obscureText;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   InkWell(
//                     child: Container(
//                       height: 50,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 230, 228, 228),
//                             Color.fromARGB(223, 82, 0, 153),
//                           ],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           "Log in",
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 227, 223, 223)),
//                         ),
//                       ),
//                     ),
//                     onTap: () {
//                       login();
//                     },
//                   ),
//                   const SizedBox(height: 60),
//                   Column(
//                     children: [
//                       const Text(
//                         "If you do not have a previous account",
//                         style: TextStyle(
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 255, 255, 255)),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           go_to_signUp();
//                         },
//                         child: const Text(
//                           "Create a new account",
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 54, 112, 236)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     icon: const Icon(FontAwesomeIcons.google),
//                     onPressed: () {
//                       signInWithGoogle();
//                     },
//                     iconSize: 50,
//                     color: const Color.fromARGB(255, 216, 215, 218),
//                   ),
//                   const Text(
//                     "By Google",
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }













// // Future login() async {
// //   if (check_enter_user()) {
// //     try {
// //       await FirebaseAuth.instance.signInWithEmailAndPassword(
// //         email: _email.text.trim(),
// //         password: _password.text.trim(),
// //       );
// //       Get.off(() => Home(setLocale: setLocale));
// //     } on FirebaseAuthException catch (e) {
// //       String message;

// //       if (e.code == 'user-not-found') {
// //         message = 'No account found with this email. Please sign up first.';
// //       } else if (e.code == 'wrong-password') {
// //         message = 'Incorrect password. Please try again.';
// //       } else {
// //         message = 'An error occurred. Please try again later.';
// //       }

// //       // عرض رسالة الخطأ
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(message),
// //           backgroundColor: Colors.redAccent,
// //         ),
// //       );
// //     }
// //   } else {
// //     return showModalBottomSheet(
// //       context: context,
// //       builder: (context) {
// //         return const SizedBox(
// //           height: 300,
// //           width: double.infinity,
// //           child: Center(
// //             child: Padding(
// //               padding: EdgeInsets.all(10),
// //               child: Text(
// //                 "لم تقم بإضافة البريد الإلكتروني أو كلمة المرور. حاول مجددًا.",
// //                 textAlign: TextAlign.center,
// //                 style: TextStyle(fontSize: 16),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }






























import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_99/Firebase__/signup.dart';
import 'package:graduation_project_99/pages/hometest.dart';
import 'package:graduation_project_99/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscureText = true;

  void setLocale(Locale value) async {
    setState(() {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value.languageCode);
  }






























Future signInWithGoogle() async {
  final googleUser = await GoogleSignIn().signIn();
  if (googleUser == null) {
    // إذا لم يتم تحديد حساب
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have not specified an account')),
      );
    }
    return;
  }
  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  try {
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    // إذا تم تسجيل الدخول بنجاح
    if (mounted) {
      Get.off(() => Home(setLocale: setLocale));
    }
  } on FirebaseAuthException catch (e) {
    // التعامل مع الأخطاء
    String message;
    if (e.code == 'account-exists-with-different-credential') {
      message = 'This account exists with a different credential.';
    } else {
      message = 'An error occurred. Please try again later.';
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}































  // Future signInWithGoogle() async {
  //   final googleUser = await GoogleSignIn().signIn();
  //   if (googleUser == null) {
  //     // إذا لم يتم تحديد حساب
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('You have not specified an account')),
  //     );
  //     return;
  //   }
  //   final googleAuth = await googleUser.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   try {
  //     final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //     // إذا تم تسجيل الدخول بنجاح
  //     Get.off(() => Home(setLocale: setLocale));
  //   } on FirebaseAuthException catch (e) {
  //     // التعامل مع الأخطاء
  //     String message;
  //     if (e.code == 'account-exists-with-different-credential') {
  //       message = 'This account exists with a different credential.';
  //     } else {
  //       message = 'An error occurred. Please try again later.';
  //     }
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(message)),
  //     );
  //   }
  // }

  Future login() async {
    if (check_enter_user()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );
        Get.off(() => Home(setLocale: setLocale));
      } on FirebaseAuthException catch (e) {
        String message;

        if (e.code == 'user-not-found') {
          message = 'No account found with this email. Please sign up first.';
        } else if (e.code == 'wrong-password') {
          message = 'Incorrect password. Please try again.';
        } else {
          message = 'An error occurred. Please try again later.';
        }

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 50, 0, 75),
              title: const Text(
                "Login Error",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              content: Text(
                message,
                style: const TextStyle(color: Color.fromARGB(255, 230, 230, 230)),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Color.fromARGB(255, 148, 0, 211)),
                  ),
                ),
              ],
            );
          },
        );
      }
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return const SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Please enter email and password. Try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  bool check_enter_user() {
    if (_email.text.trim() != "" && _password.text.trim() != "") {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void go_to_signUp() {
    Get.off(const signup());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 171, 124, 205),
              Color.fromARGB(255, 82, 0, 153),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            const Center(
              child: Text(
                "⁓ Fae ⁓",
                style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 82, 1, 104),
                      offset: Offset(0, 6),
                      blurRadius: 13.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 135),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _email,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person_outline),
                            hintText: "E-mail",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(Icons.lock_outline),
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 230, 228, 228),
                            Color.fromARGB(223, 82, 0, 153),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: Color.fromARGB(255, 227, 223, 223)),
                        ),
                      ),
                    ),
                    onTap: () {
                      login();
                    },
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      const Text(
                        "If you do not have a previous account",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      TextButton(
                        onPressed: () {
                          go_to_signUp();
                        },
                        child: const Text(
                          "Create a new account",
                          style: TextStyle(
                              color: Color.fromARGB(255, 54, 112, 236)),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    iconSize: 60,
                    onPressed: () {
                      signInWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
