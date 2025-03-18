import 'dart:convert';

import 'package:http/http.dart' as http;

class API_placeholder {
  static Future getPlaceHolder() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
    var response = await http.get(url);

    return response;
  }
}
