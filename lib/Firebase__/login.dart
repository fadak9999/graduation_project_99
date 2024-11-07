// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';

// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:graduation_project_99/Firebase__/signup.dart';
// import 'package:graduation_project_99/pages/home.dart';

// // ignore: camel_case_types
// class login extends StatefulWidget {
//   const login({super.key});

//   @override
//   State<login> createState() => _loginState();
// }

// // ignore: camel_case_types
// class _loginState extends State<login> {
//   //goodale..........

//   Future signInWithGoogle() async {
//     // Trigger the authentication flow
//     final googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) {
//       // ignore: use_build_context_synchronously
//       return ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('You have not specified an account')));
//     }
//     // Obtain the auth details from the request
//     final googleAuth = await googleUser.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }

//   //googal.

//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   bool _obscureText = true;

//   Future login() async {
//     if (check_enter_user()) {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _email.text.trim(), password: _password.text.trim());
//       Get.off(() => const Home());
//     } else {
//       return showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return const SizedBox(
//               height: 300,
//               width: double.infinity,
//               child: Expanded(
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       "لم تقم باضافه البريد الالكتروني او كلمة المرور حاول مجددا ",
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           });
//     }
//   }

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

//   //
//   @override
//   Widget build(BuildContext context) {
//     //!_____________________________________________________________________________________________
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           // إضافة التدرج اللوني
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 255, 255, 255),
//               Color.fromARGB(255, 171, 124, 205),
//               Color.fromARGB(255, 82, 0, 153),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter, // اتجاه النهاية
//           ),
//         ),
//         child: ListView(
//           children: [
//             const SizedBox(height: 80),
//             const Center(
//                 child: Text(
//               "' nam app(^///^)'",
//               style: TextStyle(
//                   fontSize: 25,
//                   color: Color.fromARGB(255, 82, 0, 153),
//                   fontWeight: FontWeight.bold),
//             )),
//             const SizedBox(
//               height: 135,
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     height: 30,
//                   ),

//                   //email

//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 50),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: const Color.fromARGB(255, 59, 0, 74)),
//                           color: const Color.fromARGB(144, 238, 238, 238),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextField(
//                           controller: _email,
//                           decoration: const InputDecoration(
//                             labelText: 'E-mail',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),

//                   //Pssword

//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 50),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: const Color.fromARGB(255, 59, 0, 74)),
//                           color: const Color.fromARGB(144, 238, 238, 238),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextField(
//                           controller: _password,
//                           obscureText: _obscureText,
//                           decoration: InputDecoration(
//                             labelText: 'Pssword',
//                             border: InputBorder.none,
//                             // OutlineInputBorder(),
//                             prefixIcon: const Icon(Icons.lock),
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
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   //button login
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   InkWell(
//                     child: Container(
//                       height: 50,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         // إضافة التدرج اللوني
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 199, 197, 197),
//                             Color.fromARGB(255, 82, 0, 153),
//                           ],
//                           begin: Alignment.topCenter, // اتجاه البداية
//                           end: Alignment.bottomCenter, // اتجاه النهاية
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Center(
//                           child: Text(
//                         "Log in",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 227, 223, 223)),
//                       )),
//                     ),
//                     //login tap
//                     onTap: () {
//                       login();
//                     },
//                   ),
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   Column(
//                     children: [
//                       const Text(
//                         "If you do not have a previous account",
//                         style: TextStyle(
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 107, 119, 107)),
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             Get.to(() => const signup());
//                           },
//                           child: const Text(
//                             "Create a new account",
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 54, 112, 236)),
//                           )),
//                     ],
//                   ),
//                   //

//                   IconButton(
//                     icon: const Icon(FontAwesomeIcons.google),
//                     onPressed: () {
//                       signInWithGoogle();
//                     },
//                     iconSize: 50,
//                     color:
//                         const Color.fromARGB(255, 156, 63, 238), // لون الأيقونة
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_99/Firebase__/signup.dart';
import 'package:graduation_project_99/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {




  void setLocale(Locale value) async {
    setState(() {
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value.languageCode);
  }






  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscureText = true;

  Future signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // ignore: use_build_context_synchronously
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You have not specified an account')));
    }
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future login() async {
    if (check_enter_user()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
      Get.off(() => Home(setLocale: setLocale));
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return const SizedBox(
              height: 300,
              width: double.infinity,
              child: Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "لم تقم باضافه البريد الالكتروني او كلمة المرور حاول مجددا ",
                    ),
                  ),
                ),
              ),
            );
          });
    }
  }

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
  void go_to_signUp() {
    Get.off(const signup());
  }

  @override
  Widget build(BuildContext context) {
    //!_____________________________________________________
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
                      color: Color.fromARGB(255, 82, 1, 104), // لون الظل الأزرق
                      offset: Offset(0, 6), // موضع الظل
                      blurRadius: 13.0, // مستوى التمويه
                    ),
                  ],
                ),
              ),

              //     child: Text(
              //   "⁓ Fae ⁓",
              //   style: TextStyle(
              //       fontSize: 35,
              //       color: Color.fromARGB(255, 152, 53, 239),
              //       fontWeight: FontWeight.bold),
              // ),
            ),
            const SizedBox(height: 135),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  // حقل البريد الإلكتروني
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
                  // حقل كلمة المرور
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
                    icon: const Icon(FontAwesomeIcons.google),
                    onPressed: () {
                      signInWithGoogle();
                    },
                    iconSize: 50,
                    color: const Color.fromARGB(255, 216, 215, 218),
                  ),
                  const Text(
                    "By Google",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
