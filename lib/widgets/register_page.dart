import 'package:flutter/material.dart';
import 'package:project_dsi/services/infraestrurura.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  String email, usuario, senha1, senha2;

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
                dsihelper.showAlert(
                    context: context,
                    title: 'Cadastro Realizado.',
                    message: 'Faça login com seu e-mail e senha.',
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/');
                    });
              },
              child: Text(
                'Cadastrar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Colors.green[300],
            ),
            FlatButton(
              child: Text('Cancelar'),
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
