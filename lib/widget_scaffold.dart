import 'package:flutter/material.dart';

class WidgetScaffold extends StatelessWidget {
  const WidgetScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha aplicação'),
        centerTitle: true,
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Text('Minha'),
            Icon(Icons.access_alarm_sharp),
          ],
        ),
      ),
    );
  }
}
