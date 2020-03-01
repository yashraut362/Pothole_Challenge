import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pothole_challenge/Authentication/redirector.dart';

import '../../Authentication/pages/root_page.dart';
import '../../Authentication/services/authentication.dart';

class SplashScreen extends StatefulWidget {
   static const String id ='SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 3;

  startTime() async {
    return Timer(
      Duration(seconds: splashDuration),
      () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');

        //HereTo Navigate
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new RootPage(auth: new Auth()),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Text(
                    'Pothole Challenge',
                    style: TextStyle(
                      color: Color(0xff6C63FE),
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('assets/SplashScreen/road.png'),
                ),
                Container(
                  child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xff6C63FE)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
