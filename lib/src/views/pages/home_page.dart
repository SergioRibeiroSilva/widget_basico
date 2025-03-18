import "dart:convert";

import "package:flutter/material.dart";
import "package:widget_basico/api_chuck.dart";
import "package:widget_basico/api_placeholder.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  String userId = "";

  _getPlaceHolder() {
    API_placeholder.getPlaceHolder().then((response) {
      var res = json.decode(response.body);
      setState(() {
        userId = res["userId"];
      });
    });
  }

  _MyWidgetState() {
    _getPlaceHolder();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Breaking Bad")),
      body: Center(child: Text(userId)),
    );
  }
}
