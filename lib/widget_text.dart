

import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets básicos'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('widget text?',
            style: TextStyle(
            fontSize: 40,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),),
        )
      ) ,
    );
  }
}
