import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api/api_db_diario.dart';
import 'package:widget_basico/api/api_escola_movimento.dart';
import 'package:widget_basico/api/api_pttc.dart';
import 'package:widget_basico/model/model_afastamento_policial.dart';
import 'package:widget_basico/model/model_aluno.dart';
import 'package:widget_basico/model/model_pttc.dart';
import 'package:widget_basico/model/model_tarefa_app.dart';

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
    setState(() {
      ApiDbDiario.getAlunos().then((response) {
        Iterable lista = jsonDecode(response.body);
        alunos =
            lista
                .map((model) => Aluno.fromJson(model))
                .toList();
      });
    });
  }

  _getPttc() {
    ApiPttc.getPoliciais().then((response) {
      setState(() {
        Iterable lista = jsonDecode(response.body);
        policiais =
            lista
                .map(
                  (model) => PolicialPttc.fromJson(model),
                )
                .toList();
      });
    });
  }

  _getTarefas() {
    setState(() {
      ApiEscolaMovimento.getTarefas().then((response) {
        Iterable lista = jsonDecode(response.body);
        tarefas =
            lista
                .map((model) => Tarefa.fromJson(model))
                .toList();
      });
    });
  }

  _getAfastamentoPttc() {
    setState(() {
      ApiPttc.getAfastamentoPttc(2863).then((response) {
        Iterable lista = jsonDecode(response.body);
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

  bordaContainer() {
    return Border(
      top: BorderSide(width: 2),
      bottom: BorderSide(width: 2),
      left: BorderSide(width: 2),
      right: BorderSide(width: 2),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAfastamentoPttc();
    _getAlunos();
    _getPttc();
    _getTarefas();
  }

  void dispose() {
    _scrollControllerPoliciais.dispose();
    super.dispose();
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
                        tarefas[index].nomeDestinatario
                            .toString(),
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
          ],
        ),
      ),
    );
  }
}
