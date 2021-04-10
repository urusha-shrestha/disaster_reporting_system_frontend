import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu_items.dart';
import 'package:http/http.dart' as http;

class DrawerScreen extends StatelessWidget {
  static const String id = 'side_drawer';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 30.0),
      decoration: kgradientBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            /*color: Colors.red,*/
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Loader(),
                Text(
                  'Emergencia',
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  color: Colors.black26,
                ),
              ],
            ),
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
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              MenuItems(
                icon: Icons.person_rounded,
                label: 'Profile',
                onTap: () {
                  getUsers(context);
                },
              ),
            ],
          ),
          /*SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),*/
          GestureDetector(
            child: Text(
              'Log Out',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }
}

class Loader extends StatefulWidget {
  const Loader({
    Key key,
  }) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Icon(
            Icons.person_rounded,
            size: 30.0,
          )
        : Loading();
  }
}

logout(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString("token");
  Map data = {'token': token};
  var url = "http://10.0.2.2:8000/api/logout";
  http.Response response = await http.post(url, body: data);
  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    print('jsonResponse:${jsonResponse["token"]}');
    /*_save(jsonResponse["token"]);*/
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => Body()),
        (Route<dynamic> route) => false);
    createSnackBar('Successfully logged out', Colors.green, context);
    print('$context');
  } else {
    print('jsonResponse: ${jsonResponse["error"]}');
    createSnackBar('Could not logout', Colors.red, context);
  }
}
