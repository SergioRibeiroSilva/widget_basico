import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:widget_basico/services/http_interceptors.dart';

const baseUrl = "http://10.0.2.2:3001";

http.Client client = InterceptedClient.build(
  interceptors: [LoggerInterceptor()],
);

class ApiDbDiario {
  static Future getAlunos() async {
    // para http com Uri
    var url = Uri.parse("$baseUrl/alunos");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      //print("Resposta: ${response.body}");
    } else {
      print(
        "Erro na requisição de alunos: ${response.statusCode}",
      );
    }
    return response;
  }
}
