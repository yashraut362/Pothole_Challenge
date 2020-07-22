import 'package:flutter/material.dart';
import 'package:pothole/Screens/StatusAllScreen/widgets/StatusList.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.amber,
        ),
        title: Text(
          "All Submited Complaints",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: StatusList(),
    );
  }
}
