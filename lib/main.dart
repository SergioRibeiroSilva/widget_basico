import 'package:flutter/material.dart';
import 'package:widget_basico/widget_listview_chuck.dart';

void main() {
  runApp(AplicacaoPadrao());
}

class AplicacaoPadrao extends StatelessWidget {
  const AplicacaoPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coleção de widgets",
      theme: ThemeData(primaryColor: Colors.blue),
      home: BuildListViewChuck(),
    );
  }
}
