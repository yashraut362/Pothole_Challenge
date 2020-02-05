import 'package:flutter/material.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/ComplaintStatus.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/FAQ.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/NearbyComplaints.dart';
import 'package:pothole_challenge/HomeMenuPages/Presentation/NewComplaint.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PotHole Report System"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 190,
                width: 200,
                child: FlatButton(
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
              ),
              Container(
                height: 190,
                width: 200,
                child: FlatButton(
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 190,
                width: 200,
                child: FlatButton(
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
              ),
              Container(
                height: 190,
                width: 200,
                child: FlatButton(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
