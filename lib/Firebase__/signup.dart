





// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project_99/Firebase__/login.dart';
// import 'package:graduation_project_99/pages/Home.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// //todo
// // Firebase Auth: لتسجيل حساب جديد باستخدام Firebase.
// // Flutter: لإنشاء واجهة المستخدم.
// // GetX: للتنقل بين الصفحات بسهولة.
// // Shared Preferences: لتخزين إعدادات المستخدم محلياً.
// // صفحات مخصصة: الانتقال بين صفحات Login و Home.
// //todo

// // ignore: camel_case_types
// class signup extends StatefulWidget {
//   const signup({super.key});

//   @override
//   State<signup> createState() => _signupState();
// }

// // ignore: camel_case_types
// class _signupState extends State<signup> {
//   void setLocale(Locale value) async {
//     setState(() {});
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('locale', value.languageCode);
//   }

//   bool _obscureText = true;
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   final _confirmPassword = TextEditingController();
// //todo
// // متحكمات النصوص لحفظ مدخلات الحقول (الاسم، البريد، كلمة المرور، تأكيد كلمة المرور).
// // _obscureText يتحكم برؤية كلمة المرور.

//   Future signIn() async {
//     if (_email.text.isNotEmpty &&
//         _password.text.isNotEmpty &&
//         _confirmPassword.text == _password.text) {
//       try {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _email.text.trim(),
//           password: _password.text.trim(),
//         );
//         Get.off(Home(setLocale: setLocale));
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'email-already-in-use') {
//           _showErrorMessage('البريد الإلكتروني مستخدم بالفعل');
//         } else {
//           _showErrorMessage('حدث خطأ ما، حاول مرة أخرى');
//         }
//       }
//     } else {
//       _showErrorMessage('تأكد من صحة البيانات');
//     }
//   }
// //?
//   void _showErrorMessage(String message) {
//     showModalBottomSheet(
//         backgroundColor: const Color.fromARGB(255, 146, 94, 192),
//         context: context,
//         builder: (context) {
//           return SizedBox(
//             height: 300,
//             child: Center(child: Text(message)),
//           );
//         });
//   }

//   @override
//   void dispose() {
//     _name.dispose();
//     _email.dispose();
//     _password.dispose();
//     _confirmPassword.dispose();
//     super.dispose();
//   }

// //!___________________________________________________
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 142, 2, 218),
//               Color.fromARGB(255, 36, 17, 52),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: ListView(
//               padding: const EdgeInsets.all(20),
//               children: [
//                 const SizedBox(height: 70),
//                 const Center(
//                     child: Text("Sign Up",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 221, 221, 221),
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold))),
//                 const SizedBox(height: 100),

//                 // حقل الاسم
//                 _buildInputField(
//                     controller: _name,
//                     hintText: "Name",
//                     icon: Icons.person_outline),
//                 const SizedBox(height: 20),

//                 // حقل البريد الإلكتروني
//                 _buildInputField(
//                     controller: _email,
//                     hintText: "E-mail",
//                     icon: Icons.email_outlined),
//                 const SizedBox(height: 20),

//                 // حقل كلمة المرور
//                 _buildPasswordInputField(
//                     controller: _password, hintText: "Password"),
//                 const SizedBox(height: 20),

//                 // تأكيد كلمة المرور
//                 _buildPasswordInputField(
//                     controller: _confirmPassword, hintText: "Confirm Password"),
//                 const SizedBox(height: 70),

//                 // زر التسجيل
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: InkWell(
//                     onTap: signIn,
//                     child: Container(
//                       height: 60,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Color(0xFFB0A1BB), Color(0xFF520099)],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           "Sign Up",
//                           style: TextStyle(
//                               color: Color(0xFFE8DDED),
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "I have an account",
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 149, 0, 255),
//                           fontSize: 18),
//                     ),
//                     const SizedBox(width: 10),
//                     InkWell(
//                       onTap: () {
//                         Get.off(const login());
//                       },
//                       child: const Text(
//                         "Go to login",
//                         style: TextStyle(color: Colors.white, fontSize: 15),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 50),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// //////////////////////////////////////////////////
//   // إنشاء حقل إدخال
//   Widget _buildInputField(
//       {required TextEditingController controller,
//       required String hintText,
//       required IconData icon}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             offset: const Offset(4, 4),
//             blurRadius: 15,
//             spreadRadius: 1,
//           ),
//           BoxShadow(
//             color: Colors.white.withOpacity(0.8),
//             offset: const Offset(-4, -4),
//             blurRadius: 15,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           icon: Icon(icon),
//           hintText: hintText,
//         ),
//       ),
//     );
//   }

//   // إنشاء حقل إدخال لكلمة المرور
//   Widget _buildPasswordInputField(
//       {required TextEditingController controller, required String hintText}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             offset: const Offset(4, 4),
//             blurRadius: 15,
//             spreadRadius: 1,
//           ),
//           BoxShadow(
//             color: Colors.white.withOpacity(0.8),
//             offset: const Offset(-4, -4),
//             blurRadius: 15,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: _obscureText,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           icon: const Icon(Icons.lock_outline),
//           hintText: hintText,
//           suffixIcon: IconButton(
//             icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
//             onPressed: () {
//               setState(() {
//                 _obscureText = !_obscureText;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_99/Firebase__/login.dart';
import 'package:graduation_project_99/pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  void setLocale(Locale value) async {
    setState(() {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value.languageCode);
  }

  bool _obscureText = true;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  Future signIn() async {
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _confirmPassword.text == _password.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );
        Get.off(Home(setLocale: setLocale));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          _showErrorMessage('البريد الإلكتروني مستخدم بالفعل');
        } else {
          _showErrorMessage('حدث خطأ ما، حاول مرة أخرى');
        }
      }
    } else {
      _showErrorMessage('Verify that the data is correct');
    }
  }

  void _showErrorMessage(String message) {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 83, 58, 104),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 300,
            child: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 47, 3, 97),
              Color.fromARGB(255, 214, 188, 236),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 70),
                const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                _buildInputField(
                  controller: _name,
                  hintText: "Name",
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  controller: _email,
                  hintText: "E-mail",
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                _buildPasswordInputField(
                  controller: _password,
                  hintText: "Password",
                ),
                const SizedBox(height: 20),
                _buildPasswordInputField(
                  controller: _confirmPassword,
                  hintText: "Confirm Password",
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: InkWell(
                    onTap: signIn,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 109, 0, 181),
                            Color.fromARGB(255, 205, 188, 216)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I have an account",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.off(const login());
                      },
                      child: const Text(
                        "Go to login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 3, 39),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 8,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: const Offset(-2, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: const Color.fromARGB(255, 112, 0, 198)),
          hintText: hintText,
        ),
      ),
    );
  }

  Widget _buildPasswordInputField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 8,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: const Offset(-2, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon:
              const Icon(Icons.lock, color: Color.fromARGB(255, 91, 1, 156)),
          hintText: hintText,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: const Color.fromARGB(255, 164, 24, 246),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}





