import 'package:dio/dio.dart';
import 'package:widget_basico/services/http_dio_interceptors.dart';

const baseUrl = "http://10.0.2.2:3003";

final dio = Dio()..interceptors.add(ErrorInterceptor());

class ApiEscolaMovimentoDio {
  static Future getTarefasDio() async {
    var url = "$baseUrl/tarefas";

    try {
      var response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      print(
        '${'Erro tratado no interceptor! '}${e.message}',
      );
    }
  }
}
