// import 'package:flutter/material.dart';
// import './login_page.dart';

// class SignUpPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new _SignUpPageState();
//   }


  
//   class _SignUpPageState extends State<SignUpPage>{


//   final TextEditingController _emailFilter = new TextEditingController();
//   final TextEditingController _passwordFilter = new TextEditingController();
//   final TextEditingController _usernameFilter = new TextEditingController();
  
//   String _username = "";
//   String _email = "";
//   String _password = "";


//   _SignUpPageState() {
//     _usernameFilter.addListener(_usernameListen);
//     _emailFilter.addListener(_emailListen);
//     _passwordFilter.addListener(_passwordListen);
//   }

// void _usernameListen(){
//   if(_usernameFilter.text.isEmpty){
//     _username = "";
//   }else{
//     _username =_emailFilter.text;
//   }
// }

//   void _emailListen() {
//     if (_emailFilter.text.isEmpty) {
//       _email = "";
//     } else {
//       _email = _emailFilter.text;
//     }
//   }

//   void _passwordListen() {
//     if (_passwordFilter.text.isEmpty) {
//       _password = "";
//     } else {
//       _password = _passwordFilter.text;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: _buildBar(context),
//       body: new Container(
//         padding: EdgeInsets.all(16.0),
//         child: new ListView(
//           children: <Widget>[
//             _buildTextFields(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBar(BuildContext context) {
//     return new AppBar(
//       title: new Text("Create New Account"),
//       centerTitle: true,
//     );
//   }

//   Widget _buildTextFields() {
//     return new Container(
//       child: new Column(
//         children: <Widget>[

//           SizedBox(height: 20.0,),
//           new Container(
//             child: new TextFormField(
//               controller: _usernameFilter,
//               decoration: new InputDecoration(
//                 contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                 hintText: "Username",
//                 border:OutlineInputBorder(borderRadius: BorderRadius.circular(22.0)),
//               ),
//             ),
//           ),
//           SizedBox(height: 30.0,),
//           new Container(
//             child: new TextField(
//               controller: _emailFilter,
//               decoration: new InputDecoration(
//                 contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                 hintText: "Email",
//                 border:OutlineInputBorder(borderRadius: BorderRadius.circular(22.0)),
//               ),
//             ),
//           ),
//           SizedBox(height: 30.0,),
//                new Container(
//             child: new TextField(
//               controller: _passwordFilter,
//               decoration: new InputDecoration(
//                 contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                 hintText: "Password",
//                 border:OutlineInputBorder(borderRadius: BorderRadius.circular(22.0)),
//               ),
//               obscureText: true,
//             ),
//           ),
//           SizedBox(height: 30.0,),
     
//           SizedBox(height: 30.0,),
//           new Container(
//         child: new Column(
//           children: <Widget>[
//             SizedBox(height: 30.0,),
//             new MaterialButton(
//           shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//               onPressed:(){
//                  Navigator.pushReplacementNamed(context, "/home");
//               },
//               minWidth: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             color: Colors.blueAccent,
//             textColor: Colors.white,
//             child: Text("Register",
//                 textAlign: TextAlign.center,
//             ),
//             ),

//            new FlatButton(
//               child: new Text('Have an account? Click here to login.'),     
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, "/login");
//                 },
//                           )
//                         ],
//                       ),
//                     )
//                       ],
//                     ),
//                   );
//   }
//                Future navigateToSubPage(context) async {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
// }
           

//   }