import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_99/Firebase__/signup.dart';
import 'package:graduation_project_99/pages/home.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  //goodale..........

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // ignore: use_build_context_synchronously
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You have not specified an account')));
    }
    // Obtain the auth details from the request
    final googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //googal.

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscureText = true;

  Future login() async {
    if (check_enter_user()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
      Get.off(const Home());
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

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              //imag
              SizedBox(
                height: 200,
                width: 200,
                // child: Image.asset("assets/login1.avif"),
              ),
              const SizedBox(
                height: 70,
              ),

//email

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _email,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //Pssword

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
                        labelText: 'Pssword',
                        border: InputBorder.none,
                        //  OutlineInputBorder(),
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
              //button login
              const SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: const Color.fromARGB(255, 188, 188, 188),
                  ),
                  child: const Center(child: Text("Log in")),
                ),
                //login tap
                onTap: () {
                  login();
                },
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  const Text(
                    "If you do not have a previous account",
                    style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 107, 119, 107)),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.off(const signup());
                      },
                      child: const Text(
                        "Create a new account",
                        style:
                            TextStyle(color: Color.fromARGB(255, 54, 112, 236)),
                      )),
                ],
              ),
              //

              InkWell(
                onTap: signInWithGoogle,
                child: Image.network(
                  "https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=595&height=400&name=image8-2.jpg",
                  height: 100,
                  width: 100,
                ), //googale
              )

              //
            ],
          )
        ],
      ),
    );
  }
}
