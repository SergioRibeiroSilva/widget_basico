import 'package:flutter/material.dart';
import 'package:widget_basico/consumo.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({super.key});

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Senha",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );

    final buttonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: ElevatedButton(
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ConsumoGeral(),
            ),
          );
        },
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    'imagens/p.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 40),
                emailField,
                SizedBox(height: 20),
                passwordField,
                SizedBox(height: 30),
                buttonLogin,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
