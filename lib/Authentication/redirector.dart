import 'package:flutter/material.dart';
import './pages/root_page.dart';
import './services/authentication.dart';

class Redirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new RootPage(
        auth: new Auth(),
      ),
    );
  }
}
