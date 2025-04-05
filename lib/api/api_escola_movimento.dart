import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:widget_basico/services/http_interceptors.dart';

const baseUrl = "http://10.0.2.2:3003";

http.Client client = InterceptedClient.build(
  interceptors: [LoggerInterceptor()],
);

class ApiEscolaMovimento {
  static Future getTarefas() async {
    var url = Uri.parse("$baseUrl/tarefas");

    var response = await client.get(url);

    //print("${'getTarefas = '}${response.statusCode}");

    if (response.statusCode == 200) {
      //print("Resposta: ${response.body}");
    } else {
      print("Erro na requisição: ${response.statusCode}");
    }

    return response;
  }
}
