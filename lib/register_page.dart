import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  String email, usuario, senha1, senha2;

  // ignore: non_constant_identifier_names
  void Msg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastro Realizado.'),
          content: Text('Faça login com seu e-mail e senha.'),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 30,
          right: 30,
        ),
        color: Colors.white,
        child: ListView(
          children: [
            Center(
              child: Container(
                child: Text(
                  'Prencha os campos abaixo para se cadastrar:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Container(height: 20, width: 10),
            TextFormField(
              onChanged: (texte) {
                email = texte;
              },
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 20, width: 10),
            TextFormField(
              onChanged: (textu) {
                usuario = textu;
              },
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Usuário',
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 20),
            TextFormField(
              onChanged: (texts) {
                senha1 = texts;
              },
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 20),
            TextFormField(
              onChanged: (texts1) {
                senha2 = texts1;
              },
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 30),
            RaisedButton(
              onPressed: () {
                Msg();
              },
              child: Text(
                'Cadastrar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              autofocus: true,
              color: Colors.green[300],
            ),
          ],
        ),
      ),
    );
  }
}
