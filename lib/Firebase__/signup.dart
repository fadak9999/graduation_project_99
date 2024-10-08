// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:graduation_project_99/Firebase__/login.dart';
// import 'package:graduation_project_99/pages/home.dart';


// // ignore: camel_case_types
// class signup extends StatefulWidget {
//   const signup({super.key});

//   @override
//   State<signup> createState() => _signupState();
// }

// // ignore: camel_case_types
// class _signupState extends State<signup> {
//   ///
//   bool _obscureText = true;
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   // ignore: non_constant_identifier_names
//   final _confirm_password = TextEditingController();
//   Future sinIn() async {
//     if (check_enter_user()) {
//       if (passwordConfirn()) {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//             email: _email.text.trim(), password: _password.text.trim());
//         Get.off(const Home());
//       } else {
//         return showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return const SizedBox(
//                 height: 300,
//                 width: double.infinity,
//                 child: Center(
//                   child: Text(
//                     "يوجد اختلاف الرمز السري",
//                   ),
//                 ),
//               );
//             });
//       }
//     } else {
//       return showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return const SizedBox(
//               height: 300,
//               width: double.infinity,
//               child: Center(
//                 child: Text(
//                   "لم تقم باضافه ألبريد ألالكتروني او كلمة المرور حاول مجددا ",
//                 ),
//               ),
//             );
//           });
//     }
//   }

//   bool passwordConfirn() {
//     if (_password.text.trim() == _confirm_password.text.trim()) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   // ignore: non_constant_identifier_names
//   bool check_enter_user() {
//     if (_email.text.trim() != "" &&
//         _password.text.trim() != "" &&
//         _confirm_password.text.trim() != "") {
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
//     _confirm_password.dispose();
//   }

//   // ignore: non_constant_identifier_names
//   void go_to_login() {
//     Get.off(const login());
//   }

//   //////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: ListView(
//             children: [
//               //img
//             //  Image.asset("assets/signup.avif",
//             //    height: 250,
//             //   ),
//               const SizedBox(
//                 height: 10,
//               ),
//               //title
//               const Center(
//                 child: Text(
//                   "Sign in",
//                 ),
//               ),
//               //subtitle

//               const SizedBox(
//                 height: 20,
//               ),
//               //name
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Container(
//                   height: 65,
//                   width: 105,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       controller: _name,
//                       decoration: const InputDecoration(
//                           border: InputBorder.none, hintText: "name"),
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(
//                 height: 20,
//               ),
//               //email textfild
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Container(
//                   height: 65,
//                   width: 105,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       controller: _email,
//                       decoration: const InputDecoration(
//                           border: InputBorder.none, hintText: "E-mail"),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               //password textfild

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       controller: _password,
//                       obscureText: _obscureText,
//                       decoration: InputDecoration(
//                         labelText: 'Pssword',
//                         border: InputBorder.none,
//                         //  OutlineInputBorder(),
//                         prefixIcon: const Icon(Icons.lock),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureText
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureText = !_obscureText;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               // confirm password textfild

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       controller: _confirm_password,
//                       obscureText: _obscureText,
//                       decoration: InputDecoration(
//                         labelText: 'confirm Pssword',
//                         border: InputBorder.none,
//                         //  OutlineInputBorder(),
//                         prefixIcon: const Icon(Icons.lock),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureText
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureText = !_obscureText;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               // sign in botton
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: InkWell(
//                   onTap: sinIn,
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: Colors.deepPurple[600],
//                         borderRadius: BorderRadius.circular(12)),
//                     child: const Center(
//                         child: Text(
//                       "Sign in",
//                     )),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               // text  to sign up
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "I have an account",
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   InkWell(
//                     onTap: go_to_login,
//                     child: const Text(
//                       "Go to login",
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:graduation_project_99/Firebase__/login.dart';
import 'package:graduation_project_99/pages/home.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  /// التحكم في إخفاء/إظهار كلمة المرور
  bool _obscureText = true;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm_password = TextEditingController();

  Future sinIn() async {
    if (check_enter_user()) {
      if (passwordConfirn()) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text.trim(),
            password: _password.text.trim(),
          );
          Get.off(const Home()); // الانتقال إلى الصفحة الرئيسية بعد النجاح
        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-use') {
            return showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "البريد الإلكتروني مستخدم بالفعل، حاول تسجيل الدخول",
                      ),
                    ),
                  );
                });
          } else {
            return showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Center(
                      child: Text("حدث خطأ ما، حاول مرة أخرى"),
                    ),
                  );
                });
          }
        }
      } else {
        return showModalBottomSheet(
            context: context,
            builder: (context) {
              return const SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: Text("يوجد اختلاف في الرمز السري"),
                ),
              );
            });
      }
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return const SizedBox(
              height: 300,
              width: double.infinity,
              child: Center(
                child: Text("لم تقم بإضافة البريد الإلكتروني أو كلمة المرور"),
              ),
            );
          });
    }
  }

  bool passwordConfirn() {
    return _password.text.trim() == _confirm_password.text.trim();
  }

  bool check_enter_user() {
    return _email.text.trim() != "" &&
        _password.text.trim() != "" &&
        _confirm_password.text.trim() != "";
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _confirm_password.dispose();
  }

  void go_to_login() {
    Get.off(const login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Center(child: Text("Sign in")),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _name,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "name"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _email,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "E-mail"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _password,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.lock),
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
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _confirm_password,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.lock),
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
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  onTap: sinIn,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(child: Text("Sign in")),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I have an account"),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: go_to_login,
                    child: const Text("Go to login"),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
