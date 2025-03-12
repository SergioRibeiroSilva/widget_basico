import 'package:flutter/material.dart';
import 'package:widget_basico/widget_appbar.dart';
import 'package:widget_basico/widget_appbar_novos_modelos.dart';
import 'package:widget_basico/widget_appbar_tab_scroll.dart';
import 'package:widget_basico/widget_text.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coleção de widgets",
      theme: ThemeData(primaryColor: Colors.blue),
      home: AppBarTabScrollable(),
    );
  }
}
