// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         color: const Color.fromARGB(255, 232, 232, 232),
//         child: ListView(
//           children: [
//             Column(
//               children: [
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 /////

//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // يمكن إضافة إجراء عند الضغط هنا
//                         print("Container tapped!");
//                       },
//                       child: Container(
//                         width: 300,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(170),
//                             bottomLeft: Radius.circular(170),
//                             topLeft: Radius.circular(1),
//                             bottomRight: Radius.circular(1),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color.fromARGB(255, 57, 24, 63)
//                                   .withOpacity(0.5), // لون الظل البنفسجي
//                               offset: Offset(0, 10), // موضع الظل
//                               blurRadius: 10.0, // مستوى التمويه
//                             ),
//                           ],
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "اضغط هنا",
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: const Text("__________")),
      body: Container(
        color: const Color.fromARGB(255, 215, 214, 214),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الصف الأول
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButterflyWing(
                    1.0, 80.0, 80.0, 1.0, "1"), // جناح الفراشة الأيسر
                const SizedBox(width: 20), // المسافة بين الأجنحة
                buildButterflyWing(
                    80.0, 1.0, 10.0, 80.0, "2"), // جناح الفراشة الأيمن
              ],
            ),
            const SizedBox(height: 20), // المسافة بين الصفوف
            // الصف الثاني
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButterflyWing(
                    80.0, 1.0, 1.0, 80.0, "3"), // جناح الفراشة الأيسر
                const SizedBox(width: 20), // المسافة بين الأجنحة
                buildButterflyWing(
                    1.0, 80.0, 80.0, 1.0, "4"), // جناح الفراشة الأيمن
              ],
            ),
          ],
        ),
      ),
    );
  }

//__________________________________________
  Widget buildButterflyWing(
    double topLeftRadius,
    double topRightRadius,
    double bottomLeftRadius,
    double bottomRightRadius,
    String text,
  ) {
    return Container(
      width: 150, // عرض الجناح
      height: 150, // ارتفاع الجناح
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 249, 248, 248),
            Color.fromARGB(255, 71, 0, 133),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius), // زاوية العلوية اليسرى
          topRight: Radius.circular(topRightRadius), // زاوية العلوية اليمنى
          bottomLeft: Radius.circular(bottomLeftRadius), // زاوية السفلية اليسرى
          bottomRight:
              Radius.circular(bottomRightRadius), // زاوية السفلية اليمنى
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 155, 82, 168)
                .withOpacity(0.5), // لون الظل البنفسجي
            offset: const Offset(0, 15), // موضع الظل
            blurRadius: 9.0, // مستوى التمويه
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
