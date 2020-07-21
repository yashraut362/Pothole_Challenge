// import 'package:flutter/material.dart';
// import 'package:pothole/Screens/HomeMenuPages/Presentation/ComplaintStatus.dart';
// import 'package:pothole/Screens/HomeMenuPages/Presentation/FAQ.dart';
// import 'package:pothole/Screens/HomeMenuPages/Presentation/NearbyComplaints.dart';
// import 'package:pothole/Screens/HomeMenuPages/Presentation/SelectionPage.dart';
// import 'package:pothole/Screens/temp.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/TempPage':
//         return MaterialPageRoute(
//           builder: (_) => Temp(),
//         );

//       case '/Complaints':
//         return MaterialPageRoute(
//           builder: (_) => ComplaintStatus(),
//         );

//       case '/FAQ':
//         return MaterialPageRoute(
//           builder: (_) => FAQ(),
//         );

//       case '/Nearby':
//         return MaterialPageRoute(
//           builder: (_) => NearbyComplaint(),
//         );

//       case '/SelectionPage':
//         return MaterialPageRoute(
//           builder: (_) => SelectionPage(),
//         );

//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Error'),
//           ),
//           body: Center(
//             child: Text('ERROR'),
//           ),
//         );
//       },
//     );
//   }
// }
