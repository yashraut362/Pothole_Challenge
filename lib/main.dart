import 'package:flutter/material.dart';
import 'package:pothole_challenge/SplashScreen/Presentation/SplashScreen.dart';
import 'SplashScreen/Presentation/SplashScreen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}
