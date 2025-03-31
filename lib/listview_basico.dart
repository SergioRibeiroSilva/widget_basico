import 'package:flutter/material.dart';

class ListViewBasico extends StatelessWidget {
  const ListViewBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListPreview basico')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.add_location),
            trailing: Icon(Icons.add_shopping_cart),
            title: Text('Primeiro tile'),
            subtitle: Text('primeiro subtitle'),
            onTap: () {
              print('Clicou no primeiro.');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_location),
            trailing: Icon(Icons.add_shopping_cart),
            title: Text('Segundo tile'),
            subtitle: Text('segundo subtitle'),
            onTap: () {
              print('Clicou no segundo.');
            },
          ),
          Text('Posso colocar outro widget..'),
        ],
      ),
    );
  }
}
