import 'package:flutter/material.dart';
import 'package:widget_basico/consumo.dart';
import 'package:widget_basico/listview_chuck.dart';
import 'package:widget_basico/listview_aluno.dart';
import 'package:widget_basico/listview_pttc.dart';
import 'package:widget_basico/listview_tarefa_app.dart';
import 'package:widget_basico/listview_user.dart';

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
      home: ConsumoGeral(),
    );
  }
}
