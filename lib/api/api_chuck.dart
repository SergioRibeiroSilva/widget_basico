import 'package:http/http.dart' as http;

const baseUrl = 'https://api.chucknorris.io/jokes';

class API_chuck {
  static Future getChuck() async {
    var url = Uri.parse("$baseUrl/random");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Resposta: ${response.body}");
    } else {
      print("Erro na requisição: ${response.statusCode}");
    }

    return response;
  }
}
