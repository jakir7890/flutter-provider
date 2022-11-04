import 'package:flutter/material.dart';
import './api_integration.dart';
import './home_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  List _pages = [HomeScreen(), APIScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              
              _currentIndex = value;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Provider'),
            BottomNavigationBarItem(
                icon: Icon(Icons.api), label: 'Api Integration'),
          ]),
    );
  }
}
