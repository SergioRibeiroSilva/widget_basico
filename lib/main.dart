import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api_placeholder.dart';
import 'package:widget_basico/src/views/pages/home_page.dart';
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
      theme: ThemeData(useMaterial3: true),
      home: BuildListViewChuck(),
    );
  }
}
