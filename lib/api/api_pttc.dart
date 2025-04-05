import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:widget_basico/services/http_interceptors.dart';

//abaixo porta local
const baseUrl = "http://10.0.2.2:3002";
//porta do hotel é outra.......
const baseUrl_pttc_hotel = "http://10.0.2.2:3004";

http.Client client = InterceptedClient.build(
  interceptors: [LoggerInterceptor()],
);

class ApiPttc {
  static Future getPoliciais() async {
    var url = Uri.parse("$baseUrl/dados");

    var response = await client.get(url);

    //print("${'getPoliciais = '}${response.statusCode}");
    if (response.statusCode == 200) {
      //print("Resposta: ${response.body}");
    } else {
      print("Erro na requisição: ${response.statusCode}");
    }
    return response;
  }

  static Future getAfastamentoPttc(int id) async {
    var url = Uri.parse(
      "$baseUrl_pttc_hotel/afastamentos/${id}",
    );

    try {
      var response = await client.get(url);

      print(
        "${'getAfastamentoPttc = '}${response.statusCode}",
      );

      if (response.statusCode == 200) {
        //print("Afastamentos por id: ${response.body}");
      } else {
        print(
          "Erro na requisição por id, de novo: ${response.statusCode}",
        );
      }

      return response;
    } catch (e) {
      print("Erro na requisição... dentro do try");
    }
  }
}
