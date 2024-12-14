import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project_99/generated/l10n.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({super.key});

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
  String _extractedText = '';
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageAndRecognizeText() async {
    final status = await Permission.photos.status;

    if (!status.isGranted) {
      final result = await Permission.photos.request();
      if (result.isDenied) {
        _showPermissionDialog("يجب منح الإذن للوصول إلى الصور. الرجاء المحاولة مجددًا.");
        return;
      } else if (result.isPermanentlyDenied) {
        _showPermissionDialog("تم منع الوصول إلى الصور. يرجى السماح بذلك من إعدادات التطبيق.");
        return;
      }
    }

    final XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      setState(() {
        _selectedImage = File(imageFile.path);
        _extractedText = 'جارٍ استخراج النص...';
      });

      final inputImage = InputImage.fromFilePath(imageFile.path);
      final textRecognizer = TextRecognizer();

      try {
        final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

        setState(() {
          if (recognizedText.text.trim().isEmpty) {
            _extractedText = 'لا يوجد نص في هذه الصورة';
          } else {
            _extractedText = recognizedText.text;
          }
        });
      } catch (e) {
        setState(() {
          _extractedText = 'حدث خطأ أثناء استخراج النص: $e';
        });
      } finally {
        textRecognizer.close();
      }
    }
  }

  void _showPermissionDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('مشكلة في الأذونات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          content: Text(message, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('إلغاء', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: const Text('فتح الإعدادات', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery للحصول على أبعاد الشاشة لتحديد الحجم بشكل مرن
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(S.of(context)?.text_to_imag ?? 'Text to Speech'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // تحديد المسافة بين العناصر بشكل مرن
        child: Column(
          children: [
            // تعديل Container ليكون مرنًا باستخدام MediaQuery
            Container(
              height: screenHeight * 0.3, // تحديد الارتفاع بناءً على حجم الشاشة
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple[200]!),
              ),
              child: _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Center(
                      child: Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.purple,
                      ),
                    ),
            ),
            SizedBox(height: screenHeight * 0.02), // تحديد المسافة بين العناصر بشكل مرن
            ElevatedButton(
              onPressed: _pickImageAndRecognizeText,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[800],
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1, vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              child: const Text(
                'اختر صورة واستخرج النص',
                style: TextStyle(
                    color: Color.fromARGB(255, 215, 214, 215),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                width: screenWidth * 0.8, // عرض بنسبة 80% من عرض الشاشة
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
                  border: Border.all(color: Colors.purple[200]!, width: 1),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _extractedText,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // تعيين حجم الخط بناءً على عرض الشاشة
                      color: Colors.purple[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}









