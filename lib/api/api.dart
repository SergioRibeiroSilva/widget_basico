import 'package:http/http.dart' as http;

//const baseUrl = 'https://jsonplaceholder.typicode.com';

const baseUrl = "http://10.0.2.2:3000";

class API {
  static Future getUsers() async {
    //var url = Uri.parse("$baseUrl/users");
    var url = Uri.parse("$baseUrl/dados");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Resposta: ${response.body}");
    } else {
      print("Erro na requisição: ${response.statusCode}");
    }

    return response;
  }
}
