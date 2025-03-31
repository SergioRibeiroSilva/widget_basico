import 'dart:convert';
import 'package:widget_basico/api/api_pttc.dart';
import 'package:widget_basico/model/model_pttc.dart';
import 'package:flutter/material.dart';

class BuildListViewPttc extends StatefulWidget {
  const BuildListViewPttc({super.key});

  @override
  State<BuildListViewPttc> createState() =>
      _BuildListViewPttcState();
}

class _BuildListViewPttcState
    extends State<BuildListViewPttc> {
  //var users = new List<User>;

  List<PolicialPttc> policiais = [];

  _getPttc() {
    ApiPttc.getPoliciais().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        //mapeia e preenche minha lista de usuários
        policiais =
            lista
                .map(
                  (model) => PolicialPttc.fromJson(model),
                )
                .toList();
      });
    });
  }

  _BuildListViewPttcState() {
    _getPttc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de usuários')),
      body: listaPoliciais(),
    );
  }

  listaPoliciais() {
    return ListView.builder(
      itemCount: policiais.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(policiais[index].pes_nome.toString()),
          subtitle: Text(
            policiais[index].pes_telefone_celular
                .toString(),
          ),
        );
      },
    );
  }
}

//https://jsonplaceholder.typicode.com/users
