import 'dart:convert';
import 'package:http/http.dart' as http;

const String geminiApiKey = "AIzaSyArNMlzW7Dx3wbSIhoez78Nn3z8VZdMHZU"; 

Future<String> fetchGeminiResponse(String userInput) async {
  final Uri url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$geminiApiKey");

  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": userInput}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"]?[0]["content"]["parts"][0]["text"] ??
          "❌ لم يتم العثور على إجابة!";
    } else if (response.statusCode == 429) {
      return "⚠️ تم تجاوز الحد المسموح للطلبات، الرجاء المحاولة لاحقًا!";
    } else {
      return "❌ خطأ في الطلب: ${response.statusCode}";
    }
  } catch (e) {
    return "❌ خطأ أثناء الاتصال بالخادم!";
  }
}

Future<String> fetchGeminiImageResponse(String base64Image, String prompt) async {
  final Uri url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=$geminiApiKey");

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text": prompt
              },
              {
                "inline_data": {
                  "mime_type": "image/jpeg",
                  "data": base64Image
                }
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"]?[0]["content"]["parts"][0]["text"] ??
          "❌ لم يتم العثور على إجابة!";
    } else if (response.statusCode == 429) {
      return "⚠️ تم تجاوز الحد المسموح للطلبات، الرجاء المحاولة لاحقًا!";
    } else {
      print("Error response code: ${response.statusCode}");
      print("Error response body: ${response.body}");
      
      String errorMessage = "";
      try {
        final errorData = jsonDecode(response.body);
        errorMessage = errorData["error"]?["message"] ?? "";
      } catch (e) {}
      
      if (response.statusCode == 404 && errorMessage.contains("Consider switching to different model")) {
        print("Trying alternative model gemini-1.5-pro...");
        return _tryAlternativeModel(base64Image, prompt);
      }
      
      return "❌ خطأ في الطلب: ${response.statusCode}\n$errorMessage";
    }
  } catch (e) {
    print("Exception: $e");
    return "❌ خطأ أثناء الاتصال بالخادم!";
  }
}

Future<String> _tryAlternativeModel(String base64Image, String prompt) async {
  final Uri url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-pro:generateContent?key=$geminiApiKey");

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text": prompt
              },
              {
                "inline_data": {
                  "mime_type": "image/jpeg",
                  "data": base64Image
                }
              }
            ]
          }
        ],
        "generationConfig": {
          "temperature": 0.4,
          "topK": 32,
          "topP": 1,
          "maxOutputTokens": 4096
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"]?[0]["content"]["parts"][0]["text"] ??
          "❌ لم يتم العثور على إجابة!";
    } else {
      print("Alternative model also failed. Code: ${response.statusCode}");
      print("Error body: ${response.body}");
      
      String errorMessage = "";
      try {
        final errorData = jsonDecode(response.body);
        errorMessage = errorData["error"]?["message"] ?? "";
      } catch (e) {}
      
      return "❌ فشلت جميع محاولات تحليل الصورة: ${response.statusCode}\n$errorMessage";
    }
  } catch (e) {
    print("Exception with alternative model: $e");
    return "❌ خطأ أثناء الاتصال بالنموذج البديل!";
  }
}