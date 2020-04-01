import 'package:flutter/material.dart';
import '../../BottomNavBar/Pages/ComplaintPage.dart';
import '../../BottomNavBar/Pages/MapPage.dart';
import '../../BottomNavBar/Pages/ThirdPage.dart';

import '../services/auth_service.dart';
import '../widgets/providerWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [ComplaintPage(), MapPage(), ThirdPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    const PrimaryColor = const Color(0xFF2e279d);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text('HomePage'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Color(0xff2e279d),
              ),
              title: new Text('Home')),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.map,
                color: Color(0xff2e279d),
              ),
              title: new Text('Map')),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.person,
                color: Color(0xff2e279d),
              ),
              title: new Text('Account'))
        ],
      ),
    );
  }
}
