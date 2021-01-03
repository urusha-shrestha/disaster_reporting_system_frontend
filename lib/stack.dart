import 'package:flutter/material.dart';
import 'package:fyp/screens/articles_screen.dart';
import 'package:fyp/screens/profile.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';
import 'package:fyp/screens/sideNav/side_drawer.dart';
import 'package:fyp/screens/report_screen.dart';

class Stack1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ReportedDisasterScreen(),
        ],
      ),
    );
  }
}

class Stack2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ReportScreen(),
        ],
      ),
    );
  }
}

class Stack3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ArticlesScreen(),
        ],
      ),
    );
  }
}

class Stack4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
