import 'package:fyp/controllers/networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://192.168.0.110/api";
  var status;
  var token;

  void sendReport(
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

  Future<dynamic> getArticlesData() async {
    var url = '$serverUrl/articles';
    NetworkHelper networkHelper = NetworkHelper(url);
    List articles = await networkHelper.getData();
    return articles;
  }

  _save(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    sharedPreferences.setString(key, value);
  }
}
