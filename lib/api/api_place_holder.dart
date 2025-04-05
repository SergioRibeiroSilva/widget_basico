import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:widget_basico/services/http_interceptors.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com';

http.Client client = InterceptedClient.build(
  interceptors: [LoggerInterceptor()],
);

class API {
  static Future getUsers() async {
    var url = Uri.parse("$baseUrl/users");

    var response = await client.get(url);

    //print("${'getUsers = '}${response.statusCode}");

    if (response.statusCode == 200) {
      //print("Resposta em users: ${response.body}");
    } else {
      print(
        "Erro na requisição de usuários: ${response.statusCode}",
      );
    }

    return response;
  }
}
