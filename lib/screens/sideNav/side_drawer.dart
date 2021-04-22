import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu_items.dart';
import 'package:http/http.dart' as http;

class DrawerScreen extends StatefulWidget {
  static const String id = 'side_drawer';

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
            height: MediaQuery.of(context).size.height * 0.25,
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
                  setState(() {
                    isLoading = !isLoading;
                  });

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
                  setState(() {
                    isLoading = !isLoading;
                  });
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
                  setState(() {
                    isLoading = !isLoading;
                  });
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
                  setState(() {
                    isLoading = !isLoading;
                  });
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
              setState(() {
                isLoading = !isLoading;
              });
              logout(context);
            },
          ),
        ],
      ),
    );
  }

  logout(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    sharedPreferences.clear();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Body()),
          (Route<dynamic> route) => false);
    });
    setState(() {
      isLoading = false;
      createSnackBar('Successfully logged out', Colors.green, context);
    });

    /*Map data = {'token': token};
    var url = "$serverUrl/logout";
    http.Response response = await http.post(url, body: data);
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      //print('jsonResponse:${jsonResponse["token"]}');
      // _save(jsonResponse["token"]);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Body()),
          (Route<dynamic> route) => false);
      setState(() {
        createSnackBar('Successfully logged out', Colors.green, context);
      });
      isLoading = false;
      // print('$context');
    } else {
      print('jsonResponse: ${jsonResponse["error"]}');
      createSnackBar('Could not logout', Colors.red, context);
      isLoading = false;
    }*/
  }
}

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Image.asset('assets/images/icon2.png')
        : Loading();
  }
}
