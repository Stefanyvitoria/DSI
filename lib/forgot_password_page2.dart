import 'package:flutter/material.dart';

class ValidEmail extends StatefulWidget {
  @override
  State<ValidEmail> createState() {
    return ValidEmailState();
  }
}

class ValidEmailState extends State<ValidEmail> {
  String codigo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recuperar Senha'),
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
                  child: Text(
                    'Insira o código recebido por e-mail:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 25,
                  right: 25,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Código',
                      labelStyle: TextStyle(
                        fontSize: 15,
                      )),
                  onChanged: (textcodigo) {
                    codigo = textcodigo;
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('screenforgotpassword3');
                },
                child: Text('Verificar código'),
                color: Colors.green[100],
              )
            ],
          ),
        ]));
  }
}
