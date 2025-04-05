import 'package:flutter/material.dart';
import 'package:widget_basico/consumo_pttc.dart';
import 'package:widget_basico/widget_appbar.dart';
import 'package:widget_basico/widget_tela_login.dart';

class WidgetCorPreferida extends StatefulWidget {
  const WidgetCorPreferida({super.key});

  @override
  State<WidgetCorPreferida> createState() =>
      _MyWidgetState();
}

class _MyWidgetState extends State<WidgetCorPreferida> {
  String nomeCor = "";

  @override
  Widget build(BuildContext context) {
    debugPrint('construído.....');

    return Scaffold(
      appBar: AppBar(title: Text("Cor preferida")),
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
            Text(
              'Sua cor preferida é: $nomeCor ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder:
                        (context) => const WidgetLogin(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("Ir para Tela de Login"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => const ConsumoPttc(),
                  ),
                );
              },
              child: Text("PTTC"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => const WidgetAppBar(),
                  ),
                );
              },
              child: Text("AppBAr"),
            ),
          ],
        ),
      ),
    );
  }
}
