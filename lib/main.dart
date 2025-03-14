import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api.dart';
import 'package:widget_basico/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coleção de widgets",
      theme: ThemeData(primaryColor: Colors.blue),
      home: WidgetCorPreferida(),
    );
  }
}
