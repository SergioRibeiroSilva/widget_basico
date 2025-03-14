
import 'package:flutter/material.dart';

class WidgetCorPreferida extends StatefulWidget {
  const WidgetCorPreferida({super.key});

  @override
  State<WidgetCorPreferida> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WidgetCorPreferida> {  

  String nomeCor = "";

  @override
  Widget build(BuildContext context) {

    debugPrint('construído.....');

    return Scaffold(
      appBar: AppBar(
        title: Text("Cor preferida"),
      ),
      body: Container(
        margin: EdgeInsets.all(40),
        color: Colors.blue[400],
        child: Column(
          children: [
            TextField(
              onSubmitted: (String texto) {
                setState(() {
                  debugPrint('reconstruído');
                  nomeCor = texto;  
                });                
              },              
            ),
            Text('Sua cor preferida é: $nomeCor ',
            style: TextStyle(fontSize: 20),)
          ],
        ),
      ) ,
    );
  }
}