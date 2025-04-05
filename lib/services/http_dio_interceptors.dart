import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:widget_basico/main.dart';

// Classe para erro de conexão customizado
class ConnectionException implements Exception {
  final String message;
  ConnectionException(this.message);
}

// Interceptor para capturar erros de conexão
class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    print("Interceptando requisição Dio: ${options.uri}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    ///print("Interceptando resposta: ${response.statusCode}");
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    String errorMessage = "Ocorreu um erro desconhecido";

    if (err.response != null) {
      switch (err.response?.statusCode) {
        case 400:
          errorMessage =
              "....Erro 400: Requisição inválida.";
          break;
        case 401:
          errorMessage = "Erro 401: Não autorizado.";
          break;
        case 403:
          errorMessage = "Erro 403: Acesso proibido.";
          break;
        case 404:
          errorMessage =
              "....Erro 404: Recurso não encontrado.";
          break;
        case 500:
          errorMessage =
              "Erro 500: Erro interno no servidor.";
          break;
        default:
          errorMessage =
              "Erro HTTP: ${err.response?.statusCode} - ${err.response?.statusMessage}";

          errorMessage =
              "....Detalhes: ${err.response?.data}";
      }
    } else {
      // Erro sem resposta (problemas de rede, timeout, etc.)
      errorMessage = ".....Erro de conexão: ${err.message}";
    }

    //print("=================================");
    //print(errorMessage);
    //print("=================================");

    // Exibe o Snackbar globalmente
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );

    // Continua o fluxo do erro para que a aplicação possa tratar se necessário
    //handler.next(err);
  }
}
