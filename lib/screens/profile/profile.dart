import "package:flutter/material.dart";
import 'package:fyp/screens/profile/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({this.userDetails, this.userReports, this.dataLength});
  final userDetails;
  final userReports;
  final int dataLength;
  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 25.0, right: 8.0, bottom: 5.0),
              child: Container(
                child: isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        })
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 100;
                            scaleFactor = 0.8;
                            isDrawerOpen = true;
                          });
                        }),
              ),
            ),
            ProfileBody(
              userDetails: widget.userDetails,
              userReports: widget.userReports,
              dataLength: widget.dataLength,
            ),
          ],
        ),
      ),
    );
  }
}
