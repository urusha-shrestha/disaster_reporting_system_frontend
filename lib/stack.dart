import 'package:flutter/material.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/screens/articles/articles_screen.dart';
import 'package:fyp/screens/profile/profile.dart';
import 'package:fyp/screens/report/report_screen.dart';
import 'package:fyp/screens/reported_disasters/reported_disaster_screen.dart';
import 'package:fyp/screens/sideNav/side_drawer.dart';

class Stack1 extends StatefulWidget {
  Stack1({this.reportsData, this.dataLength, this.categoryImage});
  final reportsData;
  final int dataLength;
  final categoryImage;

  @override
  _Stack1State createState() => _Stack1State();
}

class _Stack1State extends State<Stack1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ReportedDisasterScreen(
            reportData: widget.reportsData,
            dataLength: widget.dataLength,
            categoryImage: widget.categoryImage,
          ),
        ],
      ),
    );
  }
}

class Stack2 extends StatefulWidget {
  Stack2({this.userID, this.categories});
  final userID;
  final categories;

  @override
  _Stack2State createState() => _Stack2State();
}

class _Stack2State extends State<Stack2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ReportScreen(
            userID: widget.userID,
            categories: widget.categories,
          ),
        ],
      ),
    );
  }
}

class Stack3 extends StatefulWidget {
  Stack3({this.categories, this.dataLength});
  final categories;
  final int dataLength;

  @override
  _Stack3State createState() => _Stack3State();
}

class _Stack3State extends State<Stack3> {
  @mustCallSuper
  @override
  void initState() {
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            body: Stack(
              children: [
                DrawerScreen(),
                ArticlesScreen(
                  categories: widget.categories,
                  dataLength: widget.dataLength,
                ),
              ],
            ),
          );
  }
}

class Stack4 extends StatefulWidget {
  Stack4(
      {this.userDetails,
      this.userReports,
      this.dataLength,
      this.categoryImages});
  final userDetails;
  final userReports;
  final int dataLength;
  final categoryImages;

  @override
  _Stack4State createState() => _Stack4State();
}

class _Stack4State extends State<Stack4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          ProfileScreen(
            userDetails: widget.userDetails,
            userReports: widget.userReports,
            dataLength: widget.dataLength,
            categoryImages: widget.categoryImages,
          ),
        ],
      ),
    );
  }
}
