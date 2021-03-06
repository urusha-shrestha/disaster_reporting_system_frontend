import 'dart:io';

import 'package:fyp/controllers/networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://192.168.0.110:8000/api";
  var status;
  var token;

/*  void sendReport(
      String _typeController,
      String _locationController,
      String _dateController,
      String _timeController,
      String _contactController,
      String _descriptionController) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = 'token';
    final value = sharedPreferences.get(key) ?? 0;
    var jsonResponse = null;

    Map data = {
      'type': _typeController,
      'location': _locationController,
      'date': _dateController,
      'time': _timeController,
      'contact': _contactController,
      'description': _descriptionController
    };

    String myUrl = "$serverUrl/reports";
    final response = await http.post(myUrl,
        headers: {'Accept': 'application/json'}, body: data);

    status = response.body.contains('error');
    jsonResponse = json.decode(response.body);

    if (status) {
      print('jsonResponse: ${jsonResponse["error"]}');
    } else {
      print('jsonResponse:${jsonResponse["token"]}');
      _save(jsonResponse["token"]);
      print('Report has been sent');
    }
  }*/

  Future<dynamic> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    var url = '$serverUrl/profile';
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getUserReportsData(userID) async {
    var url = '$serverUrl/reports/$userID';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> userReports = map["data"];
      //print(userReports);
      return userReports;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getReportsData() async {
    var url = '$serverUrl/reports';
    NetworkHelper networkHelper = NetworkHelper(url);
    List reports = await networkHelper.getData();
    return reports;
  }

  Future<dynamic> getCategoriesData() async {
    var url = '$serverUrl/category';
    NetworkHelper networkHelper = NetworkHelper(url);
    List categories = await networkHelper.getData();
    return categories;
  }

  Future<dynamic> getArticlesData(categoryID) async {
    var url = '$serverUrl/articles/$categoryID';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> articles = map["data"];
      return articles;
    } else {
      print(response.statusCode);
    }
  }

  _save(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    sharedPreferences.setString(key, value);
  }
}
