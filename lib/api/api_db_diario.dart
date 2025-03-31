import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:3001";

class ApiDbDiario {
  static Future getAlunos() async {
    var url = Uri.parse("$baseUrl/alunos");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Resposta: ${response.body}");
    } else {
      print("Erro na requisição: ${response.statusCode}");
    }

    return response;
  }
}
