import 'package:flutter/material.dart';
import '../services/authentication.dart';



class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";

  _ForgotPasswordState() {
    _emailFilter.addListener(_emailListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            _buildTextFields(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Forgot Password"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          new Container(
            child: SizedBox(
              height: 120.0,
              child: Image.asset(
                "assets/Auth/auth.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 80.0,
          ),
          new Center(
            child: new Text(
              "please enter your email to reset the password",
              style: TextStyle(color: Colors.blue, fontSize: 18.0),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          new Container(
            child: new TextFormField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0)),
              ),
            ),
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                new MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                     Navigator.pop(context);
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
