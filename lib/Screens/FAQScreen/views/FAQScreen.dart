import 'package:pothole/Screens/FAQScreen/widgets/Faqlist.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.amber,
        ),
        title: Text(
          "Frequently Asked Questions",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Faqlist(),
    );
  }
}
