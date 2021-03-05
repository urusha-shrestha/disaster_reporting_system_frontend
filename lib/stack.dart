import 'package:flutter/material.dart';
import 'package:fyp/screens/articles/articles_screen.dart';
import 'package:fyp/screens/profile/profile.dart';
import 'package:fyp/screens/report/report_screen.dart';
import 'package:fyp/screens/reported_disasters/reported_disaster_screen.dart';
import 'package:fyp/screens/sideNav/side_drawer.dart';

class Stack1 extends StatelessWidget {
  Stack1({this.reportsData, this.dataLength});
  final reportsData;
  final int dataLength;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ReportedDisasterScreen(
            reportData: reportsData,
            dataLength: dataLength,
          ),
        ],
      ),
    );
  }
}

class Stack2 extends StatelessWidget {
  Stack2({this.userID});
  final userID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ReportScreen(
            userID: userID,
          ),
        ],
      ),
    );
  }
}

class Stack3 extends StatelessWidget {
  Stack3({this.categories, this.dataLength});
  final categories;
  final int dataLength;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ArticlesScreen(
            categories: categories,
            dataLength: dataLength,
          ),
        ],
      ),
    );
  }
}

class Stack4 extends StatelessWidget {
  Stack4({this.userDetails, this.userReports, this.dataLength});
  final userDetails;
  final userReports;
  final int dataLength;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ProfileScreen(
            userDetails: userDetails,
            userReports: userReports,
            dataLength: dataLength,
          ),
        ],
      ),
    );
  }
}
