
// // ignore_for_file: file_names

// import 'dart:io';
// import 'dart:typed_data';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Chatbot extends StatefulWidget {
//   const Chatbot({super.key});

//   @override
//   State<Chatbot> createState() => _HomePageState();
// }

// class _HomePageState extends State<Chatbot> {
//   final Gemini gemini = Gemini.instance;
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _messageController =
//       TextEditingController(); // TextEditingController

//   List<ChatMessage> messages = [];
//   ChatUser currentUser = ChatUser(id: "0", firstName: "User");
//   ChatUser geminiUser = ChatUser(
//     id: "1",
//     firstName: "Gemini :) \n ",
//     profileImage: "assets/google-gemini.png",
//   );

//   @override
//   void initState() {
//     super.initState();
//     _loadProfileImage();
//   }

//   Future<void> _loadProfileImage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? imageString = prefs.getString('profile_image');
//     if (imageString != null) {
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get screen width and height for responsiveness
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 19, 18, 18),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 69, 1, 96),
//         centerTitle: true,
//         title: const Text(
//           "Gemini Chat",
//           style: TextStyle(
//               fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(
//               screenWidth * 0.05), // Add padding for responsiveness
//           child: _buildUI(screenWidth, screenHeight),
//         ),
//       ),
//     );
//   }

//   Widget _buildUI(double screenWidth, double screenHeight) {
//     return DashChat(
//       inputOptions: InputOptions(
//         textController: _messageController,
//         inputDecoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(color: Colors.white),
//           ),
//           filled: true,
//           fillColor: Colors.grey[800],
//           hintText: 'اكتب رسالتك...',
//           hintStyle: const TextStyle(color: Colors.purple),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//         ),
//         trailing: [
//           IconButton(
//             onPressed: () {
//               if (_messageController.text.trim().isNotEmpty) {
//                 _sendMessage(ChatMessage(
//                   user: currentUser,
//                   createdAt: DateTime.now(),
//                   text: _messageController.text.trim(),
//                 ));
//                 _messageController.clear(); // مسح النص بعد الإرسال
//               }
//             },
//             icon: const Icon(
//               Icons.send,
//               color: Color.fromARGB(255, 149, 26, 232),
//             ),
//           ),
//         ],
//       ),
//       currentUser: currentUser,
//       onSend: (chatMessage) {
//         _sendMessage(chatMessage);
//         _messageController.clear(); // مسح النص بعد الإرسال
//       },
//       messages: messages,
//     );

//   }

//   void _showImageSourceActionSheet() {
//     showModalBottomSheet(
//       backgroundColor: Colors.grey[850],
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       builder: (context) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(
//                   Icons.photo_library,
//                   color: Colors.white,
//                 ),
//                 title: const Text(
//                   'الاستوديو',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.gallery);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.camera_alt,
//                   color: Colors.white,
//                 ),
//                 title: const Text(
//                   'الكاميرا',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.camera);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final XFile? file = await _picker.pickImage(source: source);
//     if (file != null) {
//       _showDescriptionDialog(file);
//     }
//   }

//   void _showDescriptionDialog(XFile file) {
//     TextEditingController descriptionController = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: const Color.fromARGB(255, 66, 0, 102),
//           title: const Text(
//             "أدخل وصف للصورة",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           content: TextField(
//             controller: descriptionController,
//             decoration: const InputDecoration(
//               hintText: "اكتب الوصف هنا...",
//               hintStyle: TextStyle(color: Colors.white),
//             ),
//             style: const TextStyle(color: Colors.white),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 "إلغاء",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _sendMediaMessage(file, descriptionController.text);
//               },
//               child: const Text(
//                 "إرسال",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _sendMediaMessage(XFile file, String description) {
//     ChatMessage chatMessage = ChatMessage(
//       user: currentUser,
//       createdAt: DateTime.now(),
//       text: description,
//       medias: [
//         ChatMedia(
//           url: file.path,
//           fileName: "",
//           type: MediaType.image,
//         )
//       ],
//     );
//     _sendMessage(chatMessage);
//   }

//   void _sendMessage(ChatMessage chatMessage) {
//     setState(() {
//       messages = [chatMessage, ...messages];
//     });

//     // Add typing indicator temporarily
//     ChatMessage typingIndicator = ChatMessage(
//       user: geminiUser,
//       createdAt: DateTime.now(),
//       text: '...',
//     );

//     setState(() {
//       messages = [typingIndicator, ...messages];
//     });

//     try {
//       String question = chatMessage.text;
//       List<Uint8List>? images;
//       if (chatMessage.medias?.isNotEmpty ?? false) {
//         images = [
//           File(chatMessage.medias!.first.url).readAsBytesSync(),
//         ];
//       }

//       gemini.streamGenerateContent(question, images: images).listen((event) {
//         String response = event.content?.parts?.fold(
//                 "", (previous, current) => "$previous ${current.text}") ??
//             "";

//         // Remove typing indicator and add response
//         setState(() {
//           messages.removeWhere((msg) => msg.text == '...');
//           messages = [
//             ChatMessage(
//               user: geminiUser,
//               createdAt: DateTime.now(),
//               text: response,
//             ),
//             ...messages,
//           ];
//         });
//       });
//     } catch (e) {
//       // Handle error
//     }
//   }
// }











// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _HomePageState();
}

class _HomePageState extends State<Chatbot> {
  final Gemini gemini = Gemini.instance;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _messageController =
      TextEditingController(); // TextEditingController

  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini :) \n ",
    profileImage: "assets/google-gemini.png",
  );

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imageString = prefs.getString('profile_image');
    if (imageString != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 1, 96),
        centerTitle: true,
        title: const Text(
          "Gemini Chat",
          style: TextStyle(
              fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
              screenWidth * 0.05), // Add padding for responsiveness
          child: _buildUI(screenWidth, screenHeight),
        ),
      ),
    );
  }

Widget _buildUI(double screenWidth, double screenHeight) {
  return DashChat(
    onSend: (ChatMessage message) {
      _sendMessage(message); // معالجة الرسالة عند الإرسال
    },
    inputOptions: InputOptions(
      textController: _messageController,
      inputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.grey[800],
        hintText: 'اكتب رسالتك...',
        hintStyle: const TextStyle(color: Colors.purple),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      ),
      trailing: [
        IconButton(
          onPressed: () {
            if (_messageController.text.trim().isNotEmpty) {
              _sendMessage(ChatMessage(
                user: currentUser,
                createdAt: DateTime.now(),
                text: _messageController.text.trim(),
              ));
              _messageController.clear(); // مسح النص بعد الإرسال
            }
          },
          icon: const Icon(
            Icons.send,
            color: Color.fromARGB(255, 149, 26, 232),
          ),
        ),
      ],
    ),
    currentUser: currentUser,
    messages: messages,
    messageOptions: MessageOptions(
      currentUserContainerColor: Colors.deepPurpleAccent, // خلفية الرسائل المرسلة
      containerColor: const Color(0xFF2B2B2B), // خلفية الرسائل المستلمة
      textColor: Colors.white, // لون النص في الرسائل المستلمة
      currentUserTextColor: Colors.white, // لون النص في الرسائل المرسلة
      messagePadding: const EdgeInsets.all(12.0), // تعديل الحواف
      borderRadius: 15.0, // زوايا الرسائل المستديرة
      showOtherUsersAvatar: true, // عرض صورة المستخدم الآخر
      avatarBuilder: (user, onTap, longPress) {
        return GestureDetector(
          onTap: () {
            if (onTap != null) onTap();
          },
          onLongPress: () {
            if (longPress != null) longPress();
          },
          child: CircleAvatar(
            backgroundImage: user.profileImage != null && user.profileImage!.isNotEmpty
                ? AssetImage(user.profileImage!)
                : const AssetImage('google-gemini.png'),
            radius: 16,
          ),
        );
      },
    ),
  );
}


  Future<void> _pickImage(ImageSource source) async {
    final XFile? file = await _picker.pickImage(source: source);
    if (file != null) {
      _showDescriptionDialog(file);
    }
  }

  void _showDescriptionDialog(XFile file) {
    TextEditingController descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 66, 0, 102),
          title: const Text(
            "أدخل وصف للصورة",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: "اكتب الوصف هنا...",
              hintStyle: TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "إلغاء",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _sendMediaMessage(file, descriptionController.text);
              },
              child: const Text(
                "إرسال",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _sendMediaMessage(XFile file, String description) {
    ChatMessage chatMessage = ChatMessage(
      user: currentUser,
      createdAt: DateTime.now(),
      text: description,
      medias: [
        ChatMedia(
          url: file.path,
          fileName: "",
          type: MediaType.image,
        )
      ],
    );
    _sendMessage(chatMessage);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    // Add typing indicator temporarily
    ChatMessage typingIndicator = ChatMessage(
      user: geminiUser,
      createdAt: DateTime.now(),
      text: '...',
    );

    setState(() {
      messages = [typingIndicator, ...messages];
    });

    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }

      gemini.streamGenerateContent(question, images: images).listen((event) {
        String response = event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
            "";

        // Remove typing indicator and add response
        setState(() {
          messages.removeWhere((msg) => msg.text == '...');
          messages = [
            ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response,
            ),
            ...messages,
          ];
        });
      });
    } catch (e) {
      // Handle error
    }
  }
}
