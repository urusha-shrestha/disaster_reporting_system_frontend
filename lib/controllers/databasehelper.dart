import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://192.168.0.108:8000/api";

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

  Future<dynamic> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = 'token';
    final value = sharedPreferences.get(key) ?? 0;

    String myUrl = "$serverUrl/reports";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    var reportdata = json.decode(response.body);
    return reportdata;
  }

  _save(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    sharedPreferences.setString(key, value);
  }
}
