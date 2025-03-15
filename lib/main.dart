import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api_chuck.dart';

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

class BuildListViewChuck extends StatefulWidget {
  const BuildListViewChuck({super.key});
  @override
  State<BuildListViewChuck> createState() => _BuildListViewChuckState();
}

class _BuildListViewChuckState extends State<BuildListViewChuck> {
  String valor = "";

  _getChuck() {
    API_chuck.getChuck().then((response) {
      setState(() {
        var res = json.decode(response.body);
        valor = res['value'];
      });
    });
  }

  _BuildListViewChuckState() {
    _getChuck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chucks.....')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(valor.toString(), style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
