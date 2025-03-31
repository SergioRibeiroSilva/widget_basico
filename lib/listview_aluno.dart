import 'dart:convert';
import 'package:widget_basico/api/api_db_diario.dart';
import 'package:widget_basico/model/model_aluno.dart';
import 'package:flutter/material.dart';

class BuildListViewEscola extends StatefulWidget {
  const BuildListViewEscola({super.key});

  @override
  State<BuildListViewEscola> createState() =>
      _BuildListViewEscolaState();
}

class _BuildListViewEscolaState
    extends State<BuildListViewEscola> {
  //var users = new List<User>;

  List<Aluno> alunos = [];

  _getAlunos() {
    ApiDbDiario.getAlunos().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        //mapeia e preenche minha lista de usuários
        alunos =
            lista
                .map((model) => Aluno.fromJson(model))
                .toList();
      });
    });
  }

  _BuildListViewEscolaState() {
    _getAlunos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de alunos')),
      body: listaAlunos(),
    );
  }

  listaAlunos() {
    return ListView.builder(
      itemCount: alunos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(alunos[index].aluNome.toString()),
          subtitle: Text(
            alunos[index].aluMatricula.toString(),
          ),
        );
      },
    );
  }
}

//https://jsonplaceholder.typicode.com/users
