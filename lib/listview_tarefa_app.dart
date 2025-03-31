import 'dart:convert';
import 'package:widget_basico/api/api_escola_movimento.dart';
import 'package:widget_basico/model/model_tarefa_app.dart';
import 'package:flutter/material.dart';

class BuildListViewTarefa extends StatefulWidget {
  const BuildListViewTarefa({super.key});

  @override
  State<BuildListViewTarefa> createState() =>
      _BuildListViewTarefaState();
}

class _BuildListViewTarefaState
    extends State<BuildListViewTarefa> {
  //var users = new List<User>;

  List<Tarefa> tarefas = [];

  _getTarefas() {
    ApiEscolaMovimento.getTarefas().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        //mapeia e preenche minha lista de usuários
        tarefas =
            lista
                .map((model) => Tarefa.fromJson(model))
                .toList();
      });
    });
  }

  _BuildListViewTarefaState() {
    _getTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas - EscolaMovimento'),
      ),
      body: lista_tarefas(),
    );
  }

  lista_tarefas() {
    var url = "";
    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) {
        print("passando");

        url =
            "http://localhost/cesrc/vidaescolar/carteiraestudantil/fotos2024/" +
            tarefas[index].aluMatricula.toString() +
            ".jpg";

        return Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                url,
                width: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  );
                },
              ),
              Text(
                tarefas[index].nomeDestinatario.toString() +
                    " " +
                    url.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),

              ListTile(
                title: Text(
                  tarefas[index].titulo.toString(),
                ),
                subtitle: Text(
                  tarefas[index].descricao.toString(),
                ),
              ),
            ],
          ),
        );
        ;
      },
    );
  }
}

//https://jsonplaceholder.typicode.com/users
