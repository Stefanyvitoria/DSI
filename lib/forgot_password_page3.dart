import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  @override
  State<NewPassword> createState() {
    return NewPasswordState();
  }
}

class NewPasswordState extends State<NewPassword> {
  String novasenha = '';

  // ignore: non_constant_identifier_names
  void Msg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Senha Atualizada.'),
          content: Text('Faça login com seu e-mail e senha atualizada.'),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('screenloginpage');
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
          title: Text('Redefinir Senha'),
        ),
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 25,
                  right: 25,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Nova Senha',
                      labelStyle: TextStyle(
                        fontSize: 15,
                      )),
                  onChanged: (texts) {
                    novasenha = texts;
                    //print(email);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 25,
                  right: 25,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Confirmar Senha',
                      labelStyle: TextStyle(
                        fontSize: 15,
                      )),
                  onChanged: (texts) {
                    novasenha = texts;
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Msg();
                },
                child: Text('Redefinir senha'),
                color: Colors.green[100],
              )
            ],
          ),
        ]));
  }
}
