import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api/api_chuck.dart';

class BuildListViewChuck extends StatefulWidget {
  const BuildListViewChuck({super.key});
  @override
  State<BuildListViewChuck> createState() =>
      _BuildListViewChuckState();
}

class _BuildListViewChuckState
    extends State<BuildListViewChuck> {
  String valor = "";
  // ignore: non_constant_identifier_names
  String icon_url = "";

  _getChuck() {
    API_chuck.getChuck().then((response) {
      var res = json.decode(response.body);

      setState(() {
        valor = res['value'];
        icon_url = res['icon_url'];
      });
    });
  }

  _BuildListViewChuckState() {
    //_getChuck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chucks.....')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              valor.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
          if (icon_url != "")
            Image(image: NetworkImage(icon_url)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getChuck();
        },
        child: Icon(Icons.add_alarm),
      ),
    );
  }
}
