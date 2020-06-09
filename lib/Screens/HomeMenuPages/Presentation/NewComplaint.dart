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
        appBar: AppBar(
          title: Text(
            "New Complaint",
            style: TextStyle(color: Colors.amber),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: [
                  RaisedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    color: Colors.amber,
                    label: Text("Go on Homepage",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.amber)),
                  )
                ],
              ),
            ),
            SizedBox(height: 200),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  splashColor: Colors.amber,
                  focusColor: Colors.amber,
                  child: new Text(
                    "Capture through camera",
                    style: TextStyle(
                      color: Colors.amber,
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
                  splashColor: Colors.amber,
                  focusColor: Colors.amber,
                  child: new Text(
                    "Upload Through Gallery",
                    style: TextStyle(
                      color: Colors.amber,
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
                      backgroundColor: Colors.amber,
                      child: Icon(Icons.question_answer),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "How to Report",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
