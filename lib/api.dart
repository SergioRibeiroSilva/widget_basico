import 'package:http/http.dart' as http;

const baseUrl = 'https://jsonplaceholder.typicode.com';

class API {
  static Future getUsers() async {
    var url = Uri.parse("$baseUrl/users");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Resposta: ${response.body}");
    } else {
      print("Erro na requisição: ${response.statusCode}");
    }

    return response;
  }
}
