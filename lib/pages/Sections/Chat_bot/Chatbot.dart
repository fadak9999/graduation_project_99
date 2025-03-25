// // // ignore_for_file: file_names

// // import 'dart:io';
// // import 'dart:typed_data';
// // import 'package:dash_chat_2/dash_chat_2.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_gemini/flutter_gemini.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class Chatbot extends StatefulWidget {
// //   const Chatbot({super.key});

// //   @override
// //   State<Chatbot> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<Chatbot> {
// //   final Gemini gemini = Gemini.instance;
// //   final ImagePicker _picker = ImagePicker();
// //   final TextEditingController _messageController = TextEditingController();

// //   List<ChatMessage> messages = [];
// //   ChatUser currentUser = ChatUser(id: "0", firstName: "User");
// //   ChatUser geminiUser = ChatUser(
// //     id: "1",
// //     firstName: "Gemini :) \n ",
// //     profileImage: "assets/google-gemini.png",
// //   );

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadProfileImage();
// //   }

// //   Future<void> _loadProfileImage() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? imageString = prefs.getString('profile_image');
// //     if (imageString != null) {
// //       setState(() {});
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color.fromARGB(255, 69, 1, 96),
// //         centerTitle: true,
// //         title: const Text(
// //           "Gemini Chat",
// //           style: TextStyle(
// //               fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
// //         ),
// //         iconTheme: const IconThemeData(
// //           color: Colors.white,
// //         ),
// //       ),
// //       body: SafeArea(
// //         child: Padding(
// //           padding: EdgeInsets.all(screenWidth * 0.05),
// //           child: _buildUI(screenWidth, screenHeight),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildUI(double screenWidth, double screenHeight) {
// //     return DashChat(
// //       onSend: (ChatMessage message) {
// //         _sendMessage(message);
// //       },
// //       inputOptions: InputOptions(
// //         textController: _messageController,
// //         inputDecoration: InputDecoration(
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: const BorderSide(color: Colors.white),
// //           ),
// //           filled: true,
// //           fillColor: Colors.grey[800],
// //           hintText: 'Type your message...',
// //           hintStyle: const TextStyle(color: Colors.purple),
// //           contentPadding:
// //               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
// //           suffixIcon: IconButton(
// //             icon: const Icon(Icons.attach_file, color: Colors.white),
// //             onPressed: () {
// //               _pickImage(ImageSource.gallery);
// //             },
// //           ),
// //         ),
// //         inputTextStyle: const TextStyle(
// //           color: Colors.white,
// //           fontSize: 16.0,
// //         ),
// //         sendButtonBuilder: (VoidCallback onSend) {
// //           return IconButton(
// //             icon: const Icon(Icons.send, color: Colors.purple),
// //             onPressed: onSend,
// //           );
// //         },
// //       ),
// //       currentUser: currentUser,
// //       messages: messages,
// //       messageOptions: MessageOptions(
// //         currentUserContainerColor: Colors.deepPurpleAccent,
// //         containerColor: const Color(0xFF2B2B2B),
// //         textColor: Colors.white,
// //         currentUserTextColor: Colors.white,
// //         messagePadding: const EdgeInsets.all(12.0),
// //         borderRadius: 15.0,
// //         showOtherUsersAvatar: true,
// //         avatarBuilder: (user, onTap, longPress) {
// //           return GestureDetector(
// //             onTap: () {
// //               if (onTap != null) onTap();
// //             },
// //             onLongPress: () {
// //               if (longPress != null) longPress();
// //             },
// //             child: CircleAvatar(
// //               backgroundImage:
// //                   user.profileImage != null && user.profileImage!.isNotEmpty
// //                       ? AssetImage(user.profileImage!)
// //                       : const AssetImage('google-gemini.png'),
// //               radius: 16,
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Future<void> _pickImage(ImageSource source) async {
// //     final XFile? file = await _picker.pickImage(source: source);
// //     if (file != null) {
// //       _showDescriptionDialog(file);
// //     }
// //   }

// //   void _showDescriptionDialog(XFile file) {
// //     TextEditingController descriptionController = TextEditingController();
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           backgroundColor: const Color.fromARGB(255, 66, 0, 102),
// //           title: const Text(
// //             "Enter a description for the image",
// //             style: TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white,
// //             ),
// //           ),
// //           content: TextField(
// //             controller: descriptionController,
// //             decoration: const InputDecoration(
// //               hintText: "Write the description here...",
// //               hintStyle: TextStyle(color: Colors.white),
// //             ),
// //             style: const TextStyle(color: Colors.white),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text(
// //                 "Cancel",
// //                 style: TextStyle(
// //                   fontSize: 17,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //                 _sendMediaMessage(file, descriptionController.text);
// //               },
// //               child: const Text(
// //                 "Send",
// //                 style: TextStyle(
// //                   fontSize: 17,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _sendMediaMessage(XFile file, String description) {
// //     ChatMessage chatMessage = ChatMessage(
// //       user: currentUser,
// //       createdAt: DateTime.now(),
// //       text: description,
// //       medias: [
// //         ChatMedia(
// //           url: file.path,
// //           fileName: "",
// //           type: MediaType.image,
// //         )
// //       ],
// //     );
// //     _sendMessage(chatMessage);
// //   }

// //   void _sendMessage(ChatMessage chatMessage) {
// //     setState(() {
// //       messages = [chatMessage, ...messages];
// //     });

// //     ChatMessage typingIndicator = ChatMessage(
// //       user: geminiUser,
// //       createdAt: DateTime.now(),
// //       text: '...',
// //     );

// //     setState(() {
// //       messages = [typingIndicator, ...messages];
// //     });

// //     try {
// //       String question = chatMessage.text;
// //       List<Uint8List>? images;
// //       if (chatMessage.medias?.isNotEmpty ?? false) {
// //         images = [
// //           File(chatMessage.medias!.first.url).readAsBytesSync(),
// //         ];
// //       }

// //       gemini.streamGenerateContent(question, images: images).listen((event) {
// //         String response = event.content?.parts?.fold(
// //                 "", (previous, current) => "$previous ${current.text}") ??
// //             "";

// //         setState(() {
// //           messages.removeWhere((msg) => msg.text == '...');
// //           messages = [
// //             ChatMessage(
// //               user: geminiUser,
// //               createdAt: DateTime.now(),
// //               text: response,
// //             ),
// //             ...messages,
// //           ];
// //         });
// //       });
// //     } catch (e) {
// //       // Handle error
// //     }
// //   }
// // }






// // ignore_for_file: file_names

// import 'dart:convert';
// import 'dart:io';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'API.dart'; 

// class Chatbot extends StatefulWidget {
//   const Chatbot({super.key});

//   @override
//   State<Chatbot> createState() => _HomePageState();
// }

// class _HomePageState extends State<Chatbot> {
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _messageController = TextEditingController();
  
//   List<ChatMessage> messages = [];
//   ChatUser currentUser = ChatUser(id: "0", firstName: "User");
//   ChatUser geminiUser = ChatUser(
//     id: "1",
//     firstName: "Gemini :)",
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
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 69, 1, 96),
//         centerTitle: true,
//         title: const Text(
//           "Gemini Chat",
//           style: TextStyle(fontSize: 25, color: Colors.white),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(screenWidth * 0.05),
//           child: _buildUI(screenWidth, screenHeight),
//         ),
//       ),
//     );
//   }

//   Widget _buildUI(double screenWidth, double screenHeight) {
//     return DashChat(
//       onSend: (ChatMessage message) {
//         _sendMessage(message);
//       },
//       inputOptions: InputOptions(
//         textController: _messageController,
//         inputDecoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(color: Colors.white),
//           ),
//           filled: true,
//           fillColor: Colors.grey[800],
//           hintText: 'Type your message...',
//           hintStyle: const TextStyle(color: Colors.purple),
//           contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//           suffixIcon: IconButton(
//             icon: const Icon(Icons.attach_file, color: Colors.white),
//             onPressed: () {
//               _pickImage(ImageSource.gallery);
//             },
//           ),
//         ),
//         inputTextStyle: const TextStyle(color: Colors.white, fontSize: 16.0),
//         sendButtonBuilder: (VoidCallback onSend) {
//           return IconButton(
//             icon: const Icon(Icons.send, color: Colors.purple),
//             onPressed: onSend,
//           );
//         },
//       ),
//       currentUser: currentUser,
//       messages: messages,
//       messageOptions: MessageOptions(
//         currentUserContainerColor: Colors.deepPurpleAccent,
//         containerColor: const Color(0xFF2B2B2B),
//         textColor: Colors.white,
//         currentUserTextColor: Colors.white,
//         messagePadding: const EdgeInsets.all(12.0),
//         borderRadius: 15.0,
//         showOtherUsersAvatar: true,
//         avatarBuilder: (user, onTap, longPress) {
//           return GestureDetector(
//             onTap: () {
//               if (onTap != null) onTap();
//             },
//             onLongPress: () {
//               if (longPress != null) longPress();
//             },
//             child: CircleAvatar(
//               backgroundImage:
//                   user.profileImage != null && user.profileImage!.isNotEmpty
//                       ? AssetImage(user.profileImage!)
//                       : const AssetImage('assets/google-gemini.png'),
//               radius: 16,
//             ),
//           );
//         },
//       ),
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
//             "Enter a description for the image",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           content: TextField(
//             controller: descriptionController,
//             decoration: const InputDecoration(
//               hintText: "Write the description here...",
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
//                 "Cancel",
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
//                 _sendImageMessage(file, descriptionController.text);
//               },
//               child: const Text(
//                 "Send",
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

//   Future<void> _sendImageMessage(XFile file, String description) async {
//   try {
//     // قراءة الملف كبايتات
//     final bytes = await File(file.path).readAsBytes();
    
//     // تحويل إلى base64 - مع التأكد من عدم وجود أسطر جديدة
//     final base64Image = base64Encode(bytes).replaceAll('\n', '');
    
//     String displayText = description.isEmpty 
//         ? "📷 صورة مرفقة" 
//         : description;

//     ChatMessage chatMessage = ChatMessage(
//       user: currentUser,
//       createdAt: DateTime.now(),
//       text: displayText,
//       medias: [
//         ChatMedia(
//           url: file.path,
//           fileName: "",
//           type: MediaType.image,
//         )
//       ],
//     );

//     setState(() {
//       messages = [chatMessage, ...messages];
//     });
    
//     _sendMessageWithImage(base64Image, description);
//   } catch (e) {
//     print("Error preparing image: $e");
//     setState(() {
//       messages = [
//         ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: "⚠️ خطأ أثناء تحضير الصورة!"),
//         ...messages,
//       ];
//     });
//   }
// }

//   Future<void> _sendMessageWithImage(String base64Image, String description) async {
//     ChatMessage typingIndicator = ChatMessage(
//       user: geminiUser,
//       createdAt: DateTime.now(),
//       text: '...',
//     );

//     setState(() {
//       messages = [typingIndicator, ...messages];
//     });

//     try {
//       String prompt = description.isEmpty 
//           ? "وصف هذه الصورة بالتفصيل" 
//           : "وصف هذه الصورة: $description";
          
//       String response = await fetchGeminiImageResponse(base64Image, prompt);

//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response),
//           ...messages,
//         ];
//       });
//     } catch (e) {
//       print("Error with image: $e");
//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: "⚠️ خطأ أثناء تحليل الصورة!"),
//           ...messages,
//         ];
//       });
//     }
//   }

//   Future<void> _sendMessage(ChatMessage chatMessage) async {
//     setState(() {
//       messages = [chatMessage, ...messages];
//     });

//     ChatMessage typingIndicator = ChatMessage(
//       user: geminiUser,
//       createdAt: DateTime.now(),
//       text: '...',
//     );

//     setState(() {
//       messages = [typingIndicator, ...messages];
//     });

//     try {
//       String response = await fetchGeminiResponse(chatMessage.text);

//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response),
//           ...messages,
//         ];
//       });
//     } catch (e) {
//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: "⚠️ حدث خطأ أثناء جلب الإجابة!"),
//           ...messages,
//         ];
//       });
//     }
//   }
// }

























// import 'dart:convert';
// import 'dart:io';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'API.dart'; 

// class Chatbot extends StatefulWidget {
//   const Chatbot({super.key});

//   @override
//   State<Chatbot> createState() => _HomePageState();
// }

// class _HomePageState extends State<Chatbot> {
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _messageController = TextEditingController();
  
//   List<ChatMessage> messages = [];
//   ChatUser currentUser = ChatUser(id: "0", firstName: "User");
//   ChatUser geminiUser = ChatUser(
//     id: "1",
//     firstName: "Gemini :)",
//     profileImage: "assets/google-gemini.png",
//   );

//   Locale? _locale;

//   @override
//   void initState() {
//     super.initState();
//     _loadProfileImage();
//     _loadLanguage();  // Call _loadLanguage to load the saved language
//   }

//   Future<void> _loadProfileImage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? imageString = prefs.getString('profile_image');
//     if (imageString != null) {
//       setState(() {});
//     }
//   }

//   // Load the language from SharedPreferences
//   Future<void> _loadLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String languageCode = prefs.getString('languageCode') ?? 'en';  // Default to 'en' if no language is saved
//     setState(() {
//       _locale = Locale(languageCode);
//     });
//   }

//   // Change the language and save it to SharedPreferences
// Future<void> _changeLanguage(Locale locale) async {
//   setState(() {
//     _locale = locale;
//   });

//   // Save the selected language to SharedPreferences
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('languageCode', locale.languageCode);

//   // Update the language throughout the app using Get.updateLocale
//   Get.updateLocale(locale);  // Update the locale directly
// }


//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     if (_locale == null) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     bool isRtl = _locale!.languageCode == 'ar';

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 69, 1, 96),
//         centerTitle: true,
//         title: Text(
//           "Gemini Chat",
//           style: TextStyle(fontSize: 25, color: Colors.white),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(screenWidth * 0.05),
//           child: _buildUI(screenWidth, screenHeight),
//         ),
//       ),
//     );
//   }

//   Widget _buildUI(double screenWidth, double screenHeight) {
//     return DashChat(
//       onSend: (ChatMessage message) {
//         _sendMessage(message);
//       },
//       inputOptions: InputOptions(
//         textController: _messageController,
//         inputDecoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(color: Colors.white),
//           ),
//           filled: true,
//           fillColor: Colors.grey[800],
//           hintText: 'Type your message...',
//           hintStyle: const TextStyle(color: Colors.purple),
//           contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//           suffixIcon: IconButton(
//             icon: const Icon(Icons.attach_file, color: Colors.white),
//             onPressed: () {
//               _pickImage(ImageSource.gallery);
//             },
//           ),
//         ),
//         inputTextStyle: const TextStyle(color: Colors.white, fontSize: 16.0),
//         sendButtonBuilder: (VoidCallback onSend) {
//           return IconButton(
//             icon: const Icon(Icons.send, color: Colors.purple),
//             onPressed: onSend,
//           );
//         },
//       ),
//       currentUser: currentUser,
//       messages: messages,
//       messageOptions: MessageOptions(
//         currentUserContainerColor: Colors.deepPurpleAccent,
//         containerColor: const Color(0xFF2B2B2B),
//         textColor: Colors.white,
//         currentUserTextColor: Colors.white,
//         messagePadding: const EdgeInsets.all(12.0),
//         borderRadius: 15.0,
//         showOtherUsersAvatar: true,
//         avatarBuilder: (user, onTap, longPress) {
//           return GestureDetector(
//             onTap: () {
//               if (onTap != null) onTap();
//             },
//             onLongPress: () {
//               if (longPress != null) longPress();
//             },
//             child: CircleAvatar(
//               backgroundImage:
//                   user.profileImage != null && user.profileImage!.isNotEmpty
//                       ? AssetImage(user.profileImage!)
//                       : const AssetImage('assets/google-gemini.png'),
//               radius: 16,
//             ),
//           );
//         },
//       ),
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
//             "Enter a description for the image",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           content: TextField(
//             controller: descriptionController,
//             decoration: const InputDecoration(
//               hintText: "Write the description here...",
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
//                 "Cancel",
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
//                 _sendImageMessage(file, descriptionController.text);
//               },
//               child: const Text(
//                 "Send",
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

//   Future<void> _sendImageMessage(XFile file, String description) async {
//   try {
//     final bytes = await File(file.path).readAsBytes();
//     final base64Image = base64Encode(bytes).replaceAll('\n', '');
    
//     String displayText = description.isEmpty 
//         ? "📷 صورة مرفقة" 
//         : description;

//     ChatMessage chatMessage = ChatMessage(
//       user: currentUser,
//       createdAt: DateTime.now(),
//       text: displayText,
//       medias: [
//         ChatMedia(
//           url: file.path,
//           fileName: "",
//           type: MediaType.image,
//         )
//       ],
//     );

//     setState(() {
//       messages = [chatMessage, ...messages];
//     });

//     _sendMessageWithImage(base64Image, description);
//   } catch (e) {
//     print("Error preparing image: $e");
//     setState(() {
//       messages = [
//         ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: "⚠️ خطأ أثناء تحضير الصورة!"),
//         ...messages,
//       ];
//     });
//   }
// }

//   Future<void> _sendMessageWithImage(String base64Image, String description) async {
//     ChatMessage typingIndicator = ChatMessage(
//       user: geminiUser,
//       createdAt: DateTime.now(),
//       text: '...',
//     );

//     setState(() {
//       messages = [typingIndicator, ...messages];
//     });

//     try {
//       String prompt = description.isEmpty 
//           ? "وصف هذه الصورة بالتفصيل" 
//           : "وصف هذه الصورة: $description";
          
//       String response = await fetchGeminiImageResponse(base64Image, prompt);

//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response),
//           ...messages,
//         ];
//       });
//     } catch (e) {
//       print("Error with image: $e");
//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: "⚠️ خطأ أثناء تحليل الصورة!"),
//           ...messages,
//         ];
//       });
//     }
//   }

//   Future<void> _sendMessage(ChatMessage chatMessage) async {
//     setState(() {
//       messages = [chatMessage, ...messages];
//     });

//     ChatMessage typingIndicator = ChatMessage(
//       user: geminiUser,
//       createdAt: DateTime.now(),
//       text: '...'
//     );

//     setState(() {
//       messages = [typingIndicator, ...messages];
//     });

//     try {
//       String response = await fetchGeminiResponse(chatMessage.text);

//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response),
//           ...messages,
//         ];
//       });
//     } catch (e) {
//       setState(() {
//         messages.removeWhere((msg) => msg.text == '...');
//         messages = [
//           ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: "⚠️ حدث خطأ أثناء جلب الإجابة!"),
//           ...messages,
//         ];
//       });
//     }
//   }
// }




























import 'dart:convert';
import 'dart:io';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'API.dart'; 

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _HomePageState();
}

class _HomePageState extends State<Chatbot> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _messageController = TextEditingController();
  
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini :)",
    profileImage: "assets/google-gemini.png",
  );

  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
    _loadLanguage();  // Call _loadLanguage to load the saved language
  }

  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imageString = prefs.getString('profile_image');
    if (imageString != null) {
      setState(() {});
    }
  }

  // Load the language from SharedPreferences
  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('languageCode') ?? 'en';  // Default to 'en' if no language is saved
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  // Change the language and save it to SharedPreferences
  Future<void> _changeLanguage(Locale locale) async {
    setState(() {
      _locale = locale;
    });

    // Save the selected language to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);

    // Update the language throughout the app using Get.updateLocale
    Get.updateLocale(locale);  // Update the locale directly
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (_locale == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 1, 96),
        centerTitle: true,
        title: Text(
          S.of(context)!.chatbot_title,  // Use the localized text for title
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: _buildUI(screenWidth, screenHeight),
        ),
      ),
    );
  }

  Widget _buildUI(double screenWidth, double screenHeight) {
    return DashChat(
      onSend: (ChatMessage message) {
        _sendMessage(message);
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
          hintText: S.of(context)!.type_message_hint,  // Use the localized hint text
          hintStyle: const TextStyle(color: Colors.purple),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          suffixIcon: IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.white),
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
          ),
        ),
        inputTextStyle: const TextStyle(color: Colors.white, fontSize: 16.0),
        sendButtonBuilder: (VoidCallback onSend) {
          return IconButton(
            icon: const Icon(Icons.send, color: Colors.purple),
            onPressed: onSend,
          );
        },
      ),
      currentUser: currentUser,
      messages: messages,
      messageOptions: MessageOptions(
        currentUserContainerColor: Colors.deepPurpleAccent,
        containerColor: const Color(0xFF2B2B2B),
        textColor: Colors.white,
        currentUserTextColor: Colors.white,
        messagePadding: const EdgeInsets.all(12.0),
        borderRadius: 15.0,
        showOtherUsersAvatar: true,
        avatarBuilder: (user, onTap, longPress) {
          return GestureDetector(
            onTap: () {
              if (onTap != null) onTap();
            },
            onLongPress: () {
              if (longPress != null) longPress();
            },
            child: CircleAvatar(
              backgroundImage:
                  user.profileImage != null && user.profileImage!.isNotEmpty
                      ? AssetImage(user.profileImage!)
                      : const AssetImage('assets/google-gemini.png'),
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
          title: Text(
            S.of(context)!.enter_description,  // Use the localized text for dialog title
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: S.of(context)!.write_description_hint,  // Localized hint text for the description
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context)!.Cancel,  // Localized text for the cancel button
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _sendImageMessage(file, descriptionController.text);
              },
              child: Text(
                S.of(context)!.send,  // Localized text for the send button
                style: const TextStyle(
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

  Future<void> _sendImageMessage(XFile file, String description) async {
  try {
    final bytes = await File(file.path).readAsBytes();
    final base64Image = base64Encode(bytes).replaceAll('\n', '');
    
    String displayText = description.isEmpty 
        ? S.of(context)!.image_attached  // Use localized text for image attachment message
        : description;

    ChatMessage chatMessage = ChatMessage(
      user: currentUser,
      createdAt: DateTime.now(),
      text: displayText,
      medias: [
        ChatMedia(
          url: file.path,
          fileName: "",
          type: MediaType.image,
        )
      ],
    );

    setState(() {
      messages = [chatMessage, ...messages];
    });

    _sendMessageWithImage(base64Image, description);
  } catch (e) {
    print("Error preparing image: $e");
    setState(() {
      messages = [
        ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: S.of(context)!.error_preparing_image),  // Localized error message
        ...messages,
      ];
    });
  }
}

  Future<void> _sendMessageWithImage(String base64Image, String description) async {
    ChatMessage typingIndicator = ChatMessage(
      user: geminiUser,
      createdAt: DateTime.now(),
      text: '...',
    );

    setState(() {
      messages = [typingIndicator, ...messages];
    });

    try {
      String prompt = description.isEmpty 
          ? S.of(context)!.describe_image  // Localized prompt for description
          : "${S.of(context)!.describe_image}: $description";
          
      String response = await fetchGeminiImageResponse(base64Image, prompt);

      setState(() {
        messages.removeWhere((msg) => msg.text == '...');
        messages = [
          ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response),
          ...messages,
        ];
      });
    } catch (e) {
      print("Error with image: $e");
      setState(() {
        messages.removeWhere((msg) => msg.text == '...');
        messages = [
          ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: S.of(context)!.error_analyzing_image),  // Localized error for analysis
          ...messages,
        ];
      });
    }
  }

  Future<void> _sendMessage(ChatMessage chatMessage) async {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    ChatMessage typingIndicator = ChatMessage(
      user: geminiUser,
      createdAt: DateTime.now(),
      text: '...'
    );

    setState(() {
      messages = [typingIndicator, ...messages];
    });

    try {
      String response = await fetchGeminiResponse(chatMessage.text);

      setState(() {
        messages.removeWhere((msg) => msg.text == '...');
        messages = [
          ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response),
          ...messages,
        ];
      });
    } catch (e) {
      setState(() {
        messages.removeWhere((msg) => msg.text == '...');
        messages = [
          ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: S.of(context)!.error_fetching_response),  // Localized error message for fetching
          ...messages,
        ];
      });
    }
  }
}
