import 'package:flutter/material.dart';
import 'package:pothole/Screens/BottomNavBar/Pages/ComplaintPage.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdff6f0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Color(0xff4d80e4),
              child: const ListTile(
                leading: Icon(Icons.add_location),
                title: Text('Report new complaint'),
                subtitle: Text('You can add new complaint by tapping here'),
              ),
            ),
            Container(
              color: Color(0xff4d80e4),
              child: const ListTile(
                leading: Icon(Icons.time_to_leave),
                title: Text('Status of complaint'),
                subtitle:
                    Text('Here you can see status About Your New Complaint'),
              ),
            ),
            Container(
              color: Color(0xff4d80e4),
              child: const ListTile(
                leading: Icon(Icons.near_me),
                title: Text('Nearby Complaints'),
                subtitle: Text('Here You can see all nearby complaint'),
              ),
            ),
            Container(
              color: Color(0xff4d80e4),
              child: const ListTile(
                leading: Icon(Icons.check_box_outline_blank),
                title: Text('FAQ'),
                subtitle: Text('All Frequently Asked Question are here '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Navigator.of(context).pushReplacementNamed('/GuideScreen');
