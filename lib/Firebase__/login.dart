import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_99/Firebase__/signup.dart';
import 'package:graduation_project_99/pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

//todo
// Firebase Auth: لتوفير خدمات المصادقة.
// Material Design: لإنشاء واجهات المستخدم.
// Font Awesome: لاستخدام أيقونات مخصصة.
// GetX: لإدارة التنقل والحالة.
// Google Sign-In: لدعم تسجيل الدخول بحساب جوجل.
// Shared Preferences: لتخزين الإعدادات محلياً.
// مشاريع مخصصة (Signup/Home): للانتقال بين الصفحات.
//todo
// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

//todo  صفحة تسجيل دخول باستخدام StatefulWidget لتحديث حالة الصفحة بشكل ديناميكي.

// ignore: camel_case_types
class _loginState extends State<login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscureText = false;

  //todo
// TextEditingController: للتحكم بحقول النصوص (البريد وكلمة المرور).
// _obscureText: للتحكم برؤية كلمة المرور
//todo

  void setLocale(Locale value) async {
    setState(() {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value.languageCode);
  }
//todo  حفظ لغة المستخدم:
//? تُستخدم لتخزين الإعدادات اللغوية في ذاكرة الجهاز باستخدام SharedPreferences.

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

    GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
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
  //todo  تسجيل الدخول باستخدام Google:  ^
//   يسمح بتسجيل الدخول باستخدام Google.
// يتحقق مما إذا تم تسجيل الدخول بنجاح أو إظهار رسالة خطأ إذا فشل.

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
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 50, 0, 75),
              title: const Text(
                "Login Error",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              content: Text(
                message,
                style:
                    const TextStyle(color: Color.fromARGB(255, 230, 230, 230)),
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
  //todo  تسجيل الدخول بالبريد الإلكتروني:
// يتحقق من صحة البيانات المدخلة.
// يسجّل الدخول بالبريد وكلمة المرور.
// يعالج الأخطاء ويوفر إشعارات ملائمة.
  //todo

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
    Get.off(const Signup());
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
        child: ListView(
          children: [
            const SizedBox(height: 80),
            const Center(
              child: Text(
                " Ai 99 ",
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
            const SizedBox(height: 120),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  //!

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                            icon: Icon(Icons.person_outline,
                                color: Color.fromARGB(255, 87, 3,
                                    132)), // الأيقونة باللون الأرجواني
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(
                                  255, 86, 2, 131), // اللون الأرجواني
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          style: const TextStyle(
                            color: Color.fromARGB(
                                255, 89, 4, 135), // اللون الأرجواني
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  //!!22

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        //!
                        child: TextField(
                          controller: _password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(Icons.lock_outline,
                                color: Color.fromARGB(255, 93, 1, 143)),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(
                                  255, 86, 2, 131), // اللون الأرجواني
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(255, 92, 5, 139),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          style: const TextStyle(
                            color: Color.fromARGB(
                                255, 89, 4, 135), // اللون الأرجواني
                          ),
                        ),
                      ),
                    ),
                  ),
//!33
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
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                    onTap: () {
                      login();
                    },
                  ),
                  const SizedBox(height: 60),

//
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // تمركز النصوص في المنتصف
                    children: [
                      const Text(
                        "If you do not have a previous account,",
                        style: TextStyle(
                          fontSize: 12, // حجم الخط
                          color: Color.fromARGB(255, 255, 255, 255), // لون النص
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          go_to_signUp(); // استدعاء الدالة عند الضغط
                        },
                        child: const Text(
                          "Create a new account",
                          style: TextStyle(
                            fontSize: 12, // نفس حجم النص الأول
                            fontWeight:
                                FontWeight.bold, // خط غامق للنص القابل للضغط
                            color: Color.fromARGB(
                                255, 54, 112, 236), // لون أزرق للنص
                          ),
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
//todo 
// واجهة المستخدم:
// حقول الإدخال (البريد/كلمة المرور): تحتوي على تصميم جذاب مع أيقونات وخيارات لإخفاء كلمة المرور.
// زر تسجيل الدخول: ينفذ دالة login عند النقر.
// روابط تسجيل حساب جديد: للتنقل إلى صفحة التسجيل.
// زر تسجيل الدخول باستخدام Google: يتيح للمستخدمين استخدام Google لتسجيل الدخول.








