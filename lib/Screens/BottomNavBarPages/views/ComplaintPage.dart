import 'package:flutter/material.dart';
import '../widgets/cards.dart';

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "HomePage",
            style: TextStyle(color: Colors.amber),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                child: Image.asset('assets/HomePage/home.png'),
              ),
            ),
            Expanded(
              child: Cards(),
            )
          ],
        ),
        // body: Cards(),
      ),
    );
  }
}
