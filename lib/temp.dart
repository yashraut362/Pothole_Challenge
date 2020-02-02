import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("do u want to exit app ?"),
        actions: <Widget>[
          FlatButton(
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          color: Colors.black,
        ),
      ),
    );
  }
}
