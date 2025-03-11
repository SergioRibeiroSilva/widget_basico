import 'package:flutter/material.dart';
import 'package:widget_basico/widget_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //inseri comentário embaixo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo alterei no git',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetScaffold();
  }
}
