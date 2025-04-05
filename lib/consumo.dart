import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api/api_db_diario.dart';

import 'package:widget_basico/api/api_escolamovimento_dio.dart';
import 'package:widget_basico/api/api_pttc.dart';
import 'package:widget_basico/model/model_afastamento_policial.dart';
import 'package:widget_basico/model/model_aluno.dart';
import 'package:widget_basico/model/model_pttc.dart';
import 'package:widget_basico/model/model_tarefa_app.dart';
import 'package:widget_basico/stateful_basico.dart';

class ConsumoGeral extends StatefulWidget {
  const ConsumoGeral({super.key});

  @override
  State<ConsumoGeral> createState() => _ConsumoGeralState();
}

class _ConsumoGeralState extends State<ConsumoGeral> {
  final ScrollController _scrollControllerPoliciais =
      ScrollController();
  List<Aluno> alunos = [];
  List<PolicialPttc> policiais = [];
  List<Tarefa> tarefas = [];
  List<AfastamentoPolicial> afastamento_policial = [];

  _getAlunos() {
    ApiDbDiario.getAlunos().then((response) {
      Iterable lista = jsonDecode(response.body);
      setState(() {
        alunos =
            lista
                .map((model) => Aluno.fromJson(model))
                .toList();
      });
    });
  }

  _getPttc() {
    ApiPttc.getPoliciais().then((response) {
      Iterable lista = jsonDecode(response.body);
      setState(() {
        policiais =
            lista
                .map(
                  (model) => PolicialPttc.fromJson(model),
                )
                .toList();
      });
    });
  }

  /*
  _getTarefas() {
    ApiEscolaMovimento.getTarefas().then((response) {
      Iterable lista = jsonDecode(response.body);
      setState(() {
        tarefas =
            lista
                .map((model) => Tarefa.fromJson(model))
                .toList();
      });
    });
  }
  */

  _getAfastamentoPttc() {
    ApiPttc.getAfastamentoPttc(2863).then((response) {
      Iterable lista = jsonDecode(response.body);
      setState(() {
        afastamento_policial =
            lista
                .map(
                  (model) =>
                      AfastamentoPolicial.fromJson(model),
                )
                .toList();
      });
    });
  }

  //utilizando a biblioteca Dio.....
  _getTarefasDio() async {
    var response =
        await ApiEscolaMovimentoDio.getTarefasDio();

    setState(() {
      tarefas =
          (response.data as List)
              .map(
                (json) => Tarefa.fromJson(json),
              ) // Converte cada item para `Tarefa`
              .toList(); // Converte para List<Tarefa>
    });
  }
  //

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAfastamentoPttc();
    _getAlunos();
    _getPttc();
    //_getTarefas();
    _getTarefasDio();
    setState(() {
      print("??????????");
    });
  }

  void dispose() {
    _scrollControllerPoliciais.dispose();
    super.dispose();
  }

  bordaContainer() {
    return Border(
      top: BorderSide(width: 2),
      bottom: BorderSide(width: 2),
      left: BorderSide(width: 2),
      right: BorderSide(width: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumindo QUATRO API")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Policiais"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: bordaContainer(),
                  color: Colors.amber,
                ),
                height: 150, // Defina uma altura fixa
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scrollbar(
                    controller: _scrollControllerPoliciais,
                    child: ListView.builder(
                      controller:
                          _scrollControllerPoliciais,
                      itemCount: policiais.length,
                      itemBuilder: (context, index) {
                        return Text(
                          policiais[index].pes_nome
                              .toString(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Text("Alunos dbDiario"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: bordaContainer(),
                  color: Colors.orange,
                ),
                height: 150, // Defina uma altura fixa
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: alunos.length,
                    itemBuilder: (context, index) {
                      return Text(
                        alunos[index].aluNome.toString(),
                      );
                    },
                  ),
                ),
              ),
            ),
            Text("Alunos de Tarefas"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: bordaContainer(),
                  color: Colors.deepOrange,
                ),
                height: 150, // Defina uma altura fixa
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      return Text(
                        tarefas[index].descricao.toString(),
                      );
                    },
                  ),
                ),
              ),
            ),
            Text("Afastamentos do 2863"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: bordaContainer(),
                  color: Colors.deepOrange,
                ),
                height: 150, // Defina uma altura fixa
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: afastamento_policial.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            afastamento_policial[index]
                                .paf_codigo
                                .toString(),
                          ),
                          SizedBox(width: 10),
                          Text(
                            afastamento_policial[index]
                                .tpa_abreviatura
                                .toString(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            const WidgetCorPreferida(),
                  ),
                );
              },
              child: Text("Ir"),
            ),
          ],
        ),
      ),
    );
  }
}
