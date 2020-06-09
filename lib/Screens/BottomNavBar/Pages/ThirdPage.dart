import 'package:flutter/material.dart';
import 'package:pothole/Screens/Authentication/services/auth_service.dart';
import 'package:pothole/Screens/Authentication/widgets/providerWidget.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset('assets/Account/account.png'),
            SizedBox(height: 100.0),
            Center(
              child: RaisedButton.icon(
                color: Colors.amber,
                onPressed: () async {
                  try {
                    AuthService auth = Provider.of(context).auth;
                    await auth.signOut();
                  } catch (e) {
                    print(e);
                  }
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
