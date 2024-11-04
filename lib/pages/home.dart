import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project_99/pages/_Chatbot__/Chatbot.dart';
import 'package:graduation_project_99/pages/__Speech%20to%20text/Speech_to_text.dart';
import 'package:graduation_project_99/pages/__image_to_text/image_to_text.dart';
import 'package:graduation_project_99/pages/__text_to_speech/text_to_speech.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 146, 135, 153),
      ),
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 160),
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    ),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 247, 246, 246),
                      Color.fromARGB(255, 91, 3, 109)
                    ]),
                    //  color: const Color.fromARGB(255, 59, 0, 66),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 147, 24, 163)
                            .withOpacity(0.3),
                        offset: const Offset(1, 7),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 33,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.comments),
                    color: Colors.white,
                    onPressed: () {
                      //!
                      Get.to(const Chatbot());
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: const Color.fromARGB(255, 59, 0, 66),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                //?====imag
                Positioned(
                  top: 40,
                  left: 150,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.fileImage),
                    color: Colors.white,
                    onPressed: () {
                      //!
                      Get.to(const image_to_text());
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 120,
                  child: IconButton(
                    // ignore: deprecated_member_use
                    icon: const Icon(FontAwesomeIcons.fileAlt),
                    color: Colors.white,
                    onPressed: () {
                      Get.to(const image_to_text());
                    },
                  ),
                ),
                //?=========
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 160),
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    ),
                    color: const Color.fromARGB(255, 80, 17, 112),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.3),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                //?speech to text
                Positioned(
                  top: 40,
                  left: 33,
                  child: IconButton(
                    // ignore: deprecated_member_use
                    icon: const Icon(FontAwesomeIcons.fileAlt),
                    color: Colors.white,
                    onPressed: () {
                      Get.to(const speech_to_text());
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 57,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.microphone),
                    color: Colors.white,
                    onPressed: () {
                      Get.to(const speech_to_text());
                    },
                  ),
                ),
                //?[[[[[[[[[]]]]]]]]]
                //Text("data")
              ],
            ),
          ),
          //!
          const SizedBox(
            height: 40,
          ),
      
          ///
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: const Color.fromARGB(255, 59, 0, 66),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                //? text to speech
                Positioned(
                  top: 45,
                  right: 150,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.microphoneLines),
                    color: Colors.white,
                    onPressed: () {
                      //!
                      Get.to(const TextToSpeech());
                    },
                  ),
                ),
                Positioned(
                  top: 45,
                  right: 180,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.pen),
                    color: Colors.white,
                    onPressed: () {
                      //!
                      Get.to(const TextToSpeech());
                      //?
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
