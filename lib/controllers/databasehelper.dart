import 'dart:io';
import 'package:fyp/controllers/networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

String serverUrl = "http://10.0.2.2:8000/api";

class DatabaseHelper {
  /*String serverUrl = "http://10.0.2.2:8000/api";*/
  var status;
  var token;

  Future<dynamic> getReportsData() async {
    var url = '$serverUrl/reports';
    NetworkHelper networkHelper = NetworkHelper(url);
    List reports = await networkHelper.getData();
    return reports;
  }

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

  Future<dynamic> getCategoriesData() async {
    var url = '$serverUrl/category';
    NetworkHelper networkHelper = NetworkHelper(url);
    List categories = await networkHelper.getData();
    return categories;
  }

  Future<dynamic> getCategoryImage(categoryName) async {
    var url = '$serverUrl/category/$categoryName';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> categoryImage = map["data"];
      //print(categoryImage);
      return categoryImage;
    } else {
      print(response.statusCode);
    }
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

/*  _save(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    sharedPreferences.setString(key, value);
  }*/
}
