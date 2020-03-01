import 'package:flutter/material.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/ComplaintStatus.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/FAQ.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/NearbyComplaints.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/NewComplaint.dart';

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.end,
            direction: Axis.horizontal,
            spacing: 10.0,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.white,
                    textColor: Colors.blue,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewComplaint()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/HomePage/Complaint.jpg'),
                        SizedBox(height: 10),
                        Text(
                          "New complaint".toUpperCase(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.white,
                    textColor: Colors.blue,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ComplaintStatus()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/HomePage/status.jpg'),
                        Text(
                          "Your Complaints".toUpperCase(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue)),
                  color: Colors.white,
                  textColor: Colors.blue,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NearbyComplaint()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/HomePage/nearby.png'),
                      Text(
                        "Nearby Complaints".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  )),
              FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue)),
                  color: Colors.white,
                  textColor: Colors.blue,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FAQ()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/HomePage/faq.jpg'),
                      Text(
                        "FAQ".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
