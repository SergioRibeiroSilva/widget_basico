import 'package:flutter/material.dart';
import 'package:widget_basico/widget_tela_login.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(AplicacaoPadrao());
}

class AplicacaoPadrao extends StatelessWidget {
  const AplicacaoPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey, // Define a
      title: "Coleção de widgets",
      theme: ThemeData(primaryColor: Colors.blue),
      home: WidgetLogin(),
    );
  }
}
