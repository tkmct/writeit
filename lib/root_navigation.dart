import 'package:flutter/material.dart';
import './chart/screen.dart';
import './write/screen.dart';

class RootNavigation extends StatefulWidget {
  RootNavigation({Key key}) : super(key: key);

  @override
  _RootNavigationState createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  int _currentIndex = 0;
  var _screens = [
    WriteScreen(),
    ChartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _screens.elementAt(_currentIndex)),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit), title: Text('Write')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.show_chart), title: Text('Chart')),
            ],
            currentIndex: _currentIndex,
            fixedColor: Colors.cyan,
            onTap: _onBarItemTap));
  }

  void _onBarItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
