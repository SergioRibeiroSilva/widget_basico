import 'package:flutter/material.dart';

final itens = List<String>.generate(10000, (i) => "Meu item $i");

class ListViewBuild extends StatelessWidget {
  const ListViewBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView.build basixo')),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.add_alarm),
            title: Text('${itens[index]}'),
            trailing: Icon(Icons.add_a_photo),
            onTap: () {
              print('clicou no item $index');
            },
          );
        },
      ),
    );
  }
}
