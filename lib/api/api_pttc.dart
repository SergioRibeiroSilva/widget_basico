import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:3002";
//porta do hotel é outra.......
const baseUrl_pttc_hotel = "http://10.0.2.2:3004";

class ApiPttc {
  static Future getPoliciais() async {
    var url = Uri.parse("$baseUrl/dados");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Resposta: ${response.body}");
    } else {
      print("Erro na requisição: ${response.statusCode}");
    }

    return response;
  }

  static Future getAfastamentoPttc(int id) async {
    var url = Uri.parse(
      "$baseUrl_pttc_hotel/afastamentos/${id}",
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Afastamentos por id: ${response.body}");
    } else {
      print(
        "Erro na requisição por id: ${response.statusCode}",
      );
    }

    return response;
  }
}
