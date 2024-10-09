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
  // ignore: non_constant_identifier_names
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
                // ignore: use_build_context_synchronously
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
                // ignore: use_build_context_synchronously
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

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
  void go_to_login() {
    Get.off(const login());
  }

  @override
  Widget build(BuildContext context) {
    //!______________________________________________________
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 82, 0, 153),
            ], // ألوان التدرج
            begin: Alignment.topCenter, // بداية التدرج
            end: Alignment.bottomCenter, // نهاية التدرج
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ListView(
              children: [
                const SizedBox(height: 70),
                const Center(
                    child: Text("' Sign Up '",
                        style: TextStyle(
                            color: Color.fromARGB(255, 120, 39, 163),
                            fontSize: 30,
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Container(
                    height: 59,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 59, 0, 74)),
                      color: const Color.fromARGB(166, 212, 210, 212),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 59, 0, 74)),
                      color: const Color.fromARGB(166, 212, 210, 212),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _email,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "E-mail",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 59, 0, 74)),
                      color: const Color.fromARGB(166, 212, 210, 212),
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 59, 0, 74)),
                      color: const Color.fromARGB(166, 212, 210, 212),
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: InkWell(
                    onTap: sinIn,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 100, left: 100),
                      child: Container(
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 176, 161, 187),
                              Color.fromARGB(255, 82, 0, 153),
                            ],
                            begin: Alignment.topCenter, // اتجاه البداية
                            end: Alignment.bottomCenter, // اتجاه النهاية
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 232, 221, 237),
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I have an account",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: go_to_login,
                      child: const Text(
                        "Go to login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 247, 247, 247),
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
