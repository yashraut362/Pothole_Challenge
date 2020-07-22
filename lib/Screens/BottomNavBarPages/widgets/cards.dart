import 'package:flutter/material.dart';
import 'package:pothole/Screens/FAQScreen/views/FAQScreen.dart';

import 'package:pothole/Screens/HomeMenuPages/views/ComplaintForm.dart';
import 'package:pothole/Screens/HomeMenuPages/views/SelectionPage.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectionPage()),
              );
            },
            child: Container(
              height: 120,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 160),
                    height: 120,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.amber[200], Colors.amber],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Report New Complaint",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset('assets/HomePage/report.png'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 120,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 160),
                    height: 120,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.amber[200], Colors.amber],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Status of all reports",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset('assets/HomePage/status.png'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 120,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 160),
                    height: 120,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.amber[200], Colors.amber],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FAQScreen()),
                        );
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "FAQ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset('assets/HomePage/FAQ.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Navigator.of(context).pushReplacementNamed('/GuideScreen');
