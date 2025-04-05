import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api/api_pttc.dart';
import 'package:widget_basico/model/model_pttc.dart';

class ConsumoPttc extends StatefulWidget {
  const ConsumoPttc({super.key});

  @override
  State<ConsumoPttc> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ConsumoPttc> {
  ///
  List<PolicialPttc> policiais = [];

  ///
  final Future _futureGetPolicial = ApiPttc.getPoliciais();

  ///
  ///
  ///

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PTTC com FutureBuilder")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder(
            future: _futureGetPolicial,
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("'Erro: ${snapshot.error}'"),
                );
              } else if (snapshot.hasData) {
                //
                var res = snapshot.data;

                Iterable lista = jsonDecode(res.body);
                policiais =
                    lista
                        .map(
                          (model) =>
                              PolicialPttc.fromJson(model),
                        )
                        .toList();
                print("passando no builder");
                //
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    return Text(
                      policiais[index].pes_nome.toString(),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("Nenhum dado disponível"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
