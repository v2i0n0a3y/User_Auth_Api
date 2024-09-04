// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class BusinessHour extends StatefulWidget {
//   const BusinessHour({super.key});
//
//   @override
//   State<BusinessHour> createState() => _BusinessHourState();
// }
//
// class _BusinessHourState extends State<BusinessHour> {
//
//   List<TextEditingController> monControllers = [];
//   List<TextEditingController> tueControllers = [];
// // Repeat for other days....
//
// // Initialize controllers in initState()
//   @override
//   void initState() {
//     super.initState();
//     monControllers.add(TextEditingController());
//     monControllers.add(TextEditingController());
//     tueControllers.add(TextEditingController());
//     // Repeat for other days...
//   }
//
//   void postBusinessHours() async {
//     final response = await http.post(
//       Uri.parse('https://your-api-endpoint.com/endpoint'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "business_hours": businessHours,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       // Success
//     } else {
//       // Handle error
//     }
//    }
//   // Map<String, dynamic> businessHours = {
//   //   "mon": monControllers.map((c) => c.text).toList(),
//   //   "tue": tueControllers.map((c) => c.text).toList(),
//   //   // Repeat for other days...
//   // };
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextField(
//             controller: monControllers[0],
//             decoration: InputDecoration(labelText: 'Monday Slot 1'),
//           ),
//           TextField(
//             controller: monControllers[1],
//             decoration: InputDecoration(labelText: 'Monday Slot 2'),
//           ),
//
//
//           ElevatedButton(
//             onPressed: postBusinessHours,
//             child: Text('Submit'),
//           ),
//
//           // Repeat for other days...
//         ],
//       ),
//
//
//     );
//   }
// }
