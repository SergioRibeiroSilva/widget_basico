import 'package:flutter/material.dart';

class WidgetScaffold extends StatelessWidget {
  const WidgetScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minha aplicação')),
      body: Center(
        child: Text(
          'Olá! Alterando. de novo....',
          style: TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
