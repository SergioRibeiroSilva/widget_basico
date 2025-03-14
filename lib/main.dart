import 'package:flutter/material.dart';
import 'package:widget_basico/widget_listview_build.dart';

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
      home: ListViewBuild(),
    );
  }
}
