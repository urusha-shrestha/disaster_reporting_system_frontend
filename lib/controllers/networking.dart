import 'package:http/http.dart' as http;
import 'dart:convert';

List decodedData;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}