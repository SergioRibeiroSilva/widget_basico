import 'dart:convert';
import 'package:widget_basico/api/api.dart';
import 'package:widget_basico/model/model_user.dart';
import 'package:flutter/material.dart';

class BuildListViewUser extends StatefulWidget {
  const BuildListViewUser({super.key});

  @override
  State<BuildListViewUser> createState() =>
      _BuildListViewUserState();
}

class _BuildListViewUserState
    extends State<BuildListViewUser> {
  //var users = new List<User>;

  List<User> users = [];

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        //mapeia e preenche minha lista de usuários
        users =
            lista
                .map((model) => User.fromJson(model))
                .toList();
      });
    });
  }

  _BuildListViewUserState() {
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
