import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:fyp/stack.dart';
import 'menu_items.dart';

class DrawerScreen extends StatelessWidget {
  static const String id = 'side_drawer';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 30.0),
      decoration: kgradientBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),*/
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_rounded,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Text(
                      'USERNAME',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      getUsers(context);
                    },
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.black26,
                endIndent: 200.0,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MenuItems(
                icon: Icons.home,
                label: 'Home',
                onTap: () {
                  getReport(context);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              MenuItems(
                icon: Icons.report,
                label: 'Report a Disaster',
                onTap: () {
                  getUserID(context);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              MenuItems(
                icon: Icons.article,
                label: 'Articles',
                onTap: () {
                  getCategories(context);
                  /*Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => Stack3()),
                      (Route<dynamic> route) => false);*/
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          GestureDetector(
            child: Text(
              'Log Out',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => Body()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
