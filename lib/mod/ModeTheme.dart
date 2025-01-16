


// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// class ModeTheme {
//   static final lightMode = ThemeData(
//       useMaterial3: true,
//       colorScheme: ColorScheme.fromSeed(
//         seedColor: Colors.purple,
//         brightness: Brightness.light,
//       ));
//   //
//   static final darkMode = ThemeData(
//     useMaterial3: true,
//     colorScheme: ColorScheme.fromSeed(
//  seedColor: Colors.purple,
//       brightness: Brightness.dark,
//     ),
//   );
// }

//!

// import 'package:flutter/material.dart';

// class ModeTheme {
//   static final lightMode = ThemeData(
//     useMaterial3: true,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: Colors.purple,
//       brightness: Brightness.light,
//     ),
//   );

//   static final darkMode = ThemeData(
//     useMaterial3: true,
//     colorScheme: const ColorScheme.dark(
//       primary: Colors.purple,
//       onPrimary: Colors.white,
//       secondary: Colors.purpleAccent,
//       background:
//           Color.fromARGB(255, 68, 68, 68), // خلفية رمادية داكنة مريحة للعين
//       surface: Color(0xFF222222), // سطح يميل إلى الرمادي الداكن
//       onBackground: Color(0xFFD3D3D3), // لون النص فوق الخلفية
//       onSurface: Color(0xFFCCCCCC), // لون النص فوق الأسطح
//     ),
//     scaffoldBackgroundColor: const Color(0xFF1A1A1A), // خلفية التطبيق
//     cardColor: const Color(0xFF222222), // لون البطاقات والخلفيات الثانوية
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Color.fromARGB(255, 35, 35, 35), // لون AppBar
//       iconTheme: IconThemeData(color: Colors.white), // لون الأيقونات
//       titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
//     ),
//   );
// }
//!

// ignore_for_file: file_names



import 'package:flutter/material.dart';

class ModeTheme {
  // الوضع الفاتح مع تقليل سطوع الأبيض
  static final lightMode = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.light,
    ).copyWith(
      background: const Color(0xFFF8F8F8), // لون الخلفية أبيض مائل للرمادي
      surface: const Color(0xFFFFFFFF), // سطح أبيض مريح للعين
      onBackground: const Color(0xFF333333), // نص داكن واضح للقراءة
    ),
  );

  // الوضع الداكن مع جعل الأسود احترافي وغير داكن جدًا
  static final darkMode = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    ).copyWith(
      background: const Color(0xFF1E1E2C), // خلفية رمادية داكنة مريحة
      surface: const Color.fromARGB(255, 26, 26, 33), // سطح رمادي داكن
      onBackground: const Color(0xFFE0E0E0), // نص فاتح مريح للعين
    ),
  );
}
    





