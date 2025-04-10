// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:gallery_picker/gallery_picker.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:graduation_project_99/generated/l10n.dart';

// class ImageToText extends StatefulWidget {
//   const ImageToText({super.key});

//   @override
//   State<ImageToText> createState() => _ImageToTextState();
// }

// class _ImageToTextState extends State<ImageToText> {
//   File? selectedMedia;
//   String? extractedText = "";

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//     appBar: AppBar(
//   backgroundColor: const Color.fromARGB(255, 105, 0, 137),
//   centerTitle: true,
//   title: Text(
//     S.of(context)!.text_to_imag, // استخدام المفتاح text_to_imag من ملفات الترجمة
//     style: const TextStyle(color: Colors.white),
//   ),
// ),

//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.04),
//         child: Column(
//           children: [
//             Container(
//               height: screenHeight * 0.3,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 174, 159, 185),
//                 borderRadius: BorderRadius.circular(12),
//                 border:
//                     Border.all(color: const Color.fromARGB(255, 120, 28, 163)),
//               ),
//               child: selectedMedia != null
//                   ? ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.file(
//                         selectedMedia!,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : const Center(
//                       child: Icon(
//                         Icons.image,
//                         size: 100,
//                         color: Color.fromARGB(255, 66, 0, 86),
//                       ),
//                     ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             ElevatedButton(
//               onPressed: _pickImage,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 91, 0, 130),
//                 padding: EdgeInsets.symmetric(
//                     horizontal: screenWidth * 0.1,
//                     vertical: screenHeight * 0.02),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 elevation: 4,
//               ),
//               child: Text(
//   S.of(context)!.Choose_an_image, // استخدام المفتاح Choose_an_image من ملفات الترجمة
//   style: const TextStyle(
//     color: Colors.white,
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//   ),
// ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             Center(
//               child: Container(
//                 padding: EdgeInsets.all(screenWidth * 0.04),
//                 width: screenWidth * 0.8,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                   border: Border.all(
//                       color: const Color.fromARGB(255, 124, 7, 167), width: 1),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Text(
//                     extractedText ?? "لا يوجد نص مستخرج",
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       color: const Color.fromARGB(255, 84, 0, 105),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _pickImage() async {
//     List<MediaFile>? media = await GalleryPicker.pickMedia(
//       context: context,
//       singleMedia: true,
//     );
//     if (media != null && media.isNotEmpty) {
//       var data = await media.first.getFile();
//       setState(() {
//         selectedMedia = data;
//         extractedText = "جارٍ استخراج النص...";
//       });
//       await _extractText(data);
//     } else {
//       print("no image");
//     }
//   }

//   Future<void> _extractText(File file) async {
//     final textRecognizer = TextRecognizer(
//       script: TextRecognitionScript.latin,
//     );
//     final InputImage inputImage = InputImage.fromFile(file);
//     try {
//       final RecognizedText recognizedText =
//           await textRecognizer.processImage(inputImage);
//       setState(() {
//         extractedText = recognizedText.text.isNotEmpty
//             ? recognizedText.text
//             : "لا يوجد نص في هذه الصورة";
//       });
//     } catch (e) {
//       setState(() {
//         extractedText = "حدث خطأ أثناء استخراج النص: $e";
//       });
//     } finally {
//       textRecognizer.close();
//     }
//   }
// }







// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:gallery_picker/gallery_picker.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:graduation_project_99/generated/l10n.dart';

// class ImageToText extends StatefulWidget {
//   const ImageToText({super.key});

//   @override
//   State<ImageToText> createState() => _ImageToTextState();
// }

// class _ImageToTextState extends State<ImageToText> {
//   File? selectedMedia;
//   String? extractedText = "";

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 105, 0, 137),
//         centerTitle: true,
//         title: Text(
//           S.of(context)!.text_to_imag,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.04),
//         child: ListView(
//           children: [
//             Container(
//               height: screenHeight * 0.3,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 174, 159, 185),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: const Color.fromARGB(255, 120, 28, 163)),
//               ),
//               child: selectedMedia != null
//                   ? ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.file(
//                         selectedMedia!,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : const Center(
//                       child: Icon(
//                         Icons.image,
//                         size: 100,
//                         color: Color.fromARGB(255, 66, 0, 86),
//                       ),
//                     ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             ElevatedButton(
//               onPressed: _pickImage,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 91, 0, 130),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth * 0.1,
//                   vertical: screenHeight * 0.02,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 elevation: 4,
//               ),
//               child: Text(
//                 S.of(context)!.Choose_an_image,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             Container(
//               padding: EdgeInsets.all(screenWidth * 0.04),
//               width: screenWidth * 0.8,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//                 border: Border.all(
//                   color: const Color.fromARGB(255, 124, 7, 167),
//                   width: 1,
//                 ),
//               ),
//               child: Text(
//                 extractedText ?? "لا يوجد نص مستخرج",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.04,
//                   color: const Color.fromARGB(255, 84, 0, 105),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _pickImage() async {
//     List<MediaFile>? media = await GalleryPicker.pickMedia(
//       context: context,
//       singleMedia: true,
//     );
//     if (media != null && media.isNotEmpty) {
//       var data = await media.first.getFile();
//       setState(() {
//         selectedMedia = data;
//         extractedText = "جارٍ استخراج النص...";
//       });
//       await _extractText(data);
//     } else {
//       print("no image");
//     }
//   }

//   Future<void> _extractText(File file) async {
//     final textRecognizer = TextRecognizer(
//       script: TextRecognitionScript.latin,
//     );
//     final InputImage inputImage = InputImage.fromFile(file);
//     try {
//       final RecognizedText recognizedText =
//           await textRecognizer.processImage(inputImage);
//       setState(() {
//         extractedText = recognizedText.text.isNotEmpty
//             ? recognizedText.text
//             : "لا يوجد نص في هذه الصورة";
//       });
//     } catch (e) {
//       setState(() {
//         extractedText = "حدث خطأ أثناء استخراج النص: $e";
//       });
//     } finally {
//       textRecognizer.close();
//     }
//   }
// }











import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_99/generated/l10n.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({super.key});

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
  File? selectedMedia;
  String? extractedText = "";

  @override
  void initState() {
    super.initState();
    _loadLanguage();  // Call the function to load the saved language
  }

  // Load the language from SharedPreferences
  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('languageCode') ?? 'en';  // Default to 'en' if no language is saved
    setState(() {
    });
  }

  // Change the language and save it to SharedPreferences
 Future<void> _changeLanguage(Locale locale) async {
  setState(() {
  });

  // Save the selected language to SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('languageCode', locale.languageCode);

  // Update the language throughout the app using Get.updateLocale
  Get.updateLocale(locale);  // Update the locale directly using GetX
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 0, 137),
        centerTitle: true,
        title: Text(
          S.of(context)!.text_to_imag,  // Use the localized text
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: ListView(
          children: [
            Container(
              height: screenHeight * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 174, 159, 185),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromARGB(255, 120, 28, 163)),
              ),
              child: selectedMedia != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        selectedMedia!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Center(
                      child: Icon(
                        Icons.image,
                        size: 100,
                        color: Color.fromARGB(255, 66, 0, 86),
                      ),
                    ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 91, 0, 130),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1,
                  vertical: screenHeight * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              child: Text(
                S.of(context)!.Choose_an_image,  // Use the localized text
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: const Color.fromARGB(255, 124, 7, 167),
                  width: 1,
                ),
              ),
              child: Text(
                extractedText ?? "لا يوجد نص مستخرج",  // Default text in case of no extracted text
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: const Color.fromARGB(255, 84, 0, 105),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickImage() async {
    List<MediaFile>? media = await GalleryPicker.pickMedia(
      context: context,
      singleMedia: true,
    );
    if (media != null && media.isNotEmpty) {
      var data = await media.first.getFile();
      setState(() {
        selectedMedia = data;
        extractedText = "جارٍ استخراج النص...";
      });
      await _extractText(data);
    } else {
      print("no image");
    }
  }

  Future<void> _extractText(File file) async {
    final textRecognizer = TextRecognizer(
      script: TextRecognitionScript.latin,
    );
    final InputImage inputImage = InputImage.fromFile(file);
    try {
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      setState(() {
        extractedText = recognizedText.text.isNotEmpty
            ? recognizedText.text
            : "لا يوجد نص في هذه الصورة";
      });
    } catch (e) {
      setState(() {
        extractedText = "حدث خطأ أثناء استخراج النص: $e";
      });
    } finally {
      textRecognizer.close();
    }
  }
}
