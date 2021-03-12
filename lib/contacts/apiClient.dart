import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class _ApiClient {
  static String urlBase = 'localhost:3000';

  Future<T> get<T>(String endpoint) async {
    var url = Uri.http(urlBase, endpoint);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print('Request failed status: ${response.statusCode}.');

      return null;
    }
  }
}

_ApiClient apiClient = new _ApiClient();
