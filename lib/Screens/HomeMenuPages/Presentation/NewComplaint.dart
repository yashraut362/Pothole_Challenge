import 'package:flutter/material.dart';

class NewComplaint extends StatefulWidget {
  @override
  _NewComplaintState createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                splashColor: Color(0xff4d80e4),
                focusColor: Color(0xff4d80e4),
                child: new Text(
                  "Capture through camera",
                  style: TextStyle(
                    color: Color(0xff4d80e4),
                  ),
                ),
                onPressed: null,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              Divider(
                color: Color(0xff2e279d),
                height: 20.0,
                endIndent: 150,
                indent: 150,
                thickness: 0.5,
              ),
              OutlineButton(
                splashColor: Color(0xff4d80e4),
                focusColor: Color(0xff4d80e4),
                child: new Text(
                  "Upload Through Gallery",
                  style: TextStyle(
                    color: Color(0xff4d80e4),
                  ),
                ),
                onPressed: null,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              Divider(
                color: Color(0xff2e279d),
                height: 20.0,
                endIndent: 150,
                indent: 150,
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: null,
                    backgroundColor: Color(0xff4d80e4),
                    child: Icon(Icons.question_answer),
                  ),
                  SizedBox(width: 20),
                  Text("How to Report"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
