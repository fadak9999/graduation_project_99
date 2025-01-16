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
  final TextEditingController _messageController = TextEditingController();

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 1, 96),
        centerTitle: true,
        title: const Text(
          "Gemini Chat",
          style: TextStyle(
              fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
          hintText: 'Type your message...',
          hintStyle: const TextStyle(color: Colors.purple),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          suffixIcon: IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.white),
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
          ),
        ),
        inputTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
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
            "Enter a description for the image",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: "Write the description here...",
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
                "Cancel",
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
                "Send",
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





