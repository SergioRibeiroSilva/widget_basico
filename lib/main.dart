import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widget_basico/api.dart';
import 'package:widget_basico/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coleção de widgets",
      theme: ThemeData(primaryColor: Colors.blue),
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({super.key});

  @override
  State<BuildListView> createState() =>
      _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  //var users = new List<User>;

  List<User> users = [];

  _getUsers() {
    API.getUsers().then((response) {
      //Atualiza o layout
      setState(() {
        Iterable lista = json.decode(response.body);
        users =
            lista
                .map((model) => User.fromJson(model))
                .toList();
      });
    });
  }

  _BuildListViewState() {
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de usuários')),
      body: listaUsuarios(),
    );
  }

  listaUsuarios() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].name.toString()),
        );
      },
    );
  }
}

//https://jsonplaceholder.typicode.com/users
