import 'package:flutter/material.dart';

class ConfirmEmail extends StatefulWidget {
  @override
  State<ConfirmEmail> createState() {
    return ConfirmEmailState();
  }
}

class ConfirmEmailState extends State<ConfirmEmail> {
  String email;

  // ignore: non_constant_identifier_names
  void Msg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Instruções Enviadas'),
          content: Text('Verifique seu endereço de E-mail.'),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushReplacementNamed('screenforgotpassword2');
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
          title: Text('Recuperar senha'),
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
                  'Confirme o endereço de e-mail cadastrado e receba instruções para recuperar sua senha.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20,
                  ),
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
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 15,
                      )),
                  onChanged: (textemail) {
                    email = textemail;
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Msg();
                },
                child: Text('Confirmar'),
                color: Colors.green[100],
              )
            ],
          ),
        ]));
  }
}

class ValidCode extends StatefulWidget {
  @override
  State<ValidCode> createState() {
    return ValidCodeState();
  }
}

class ValidCodeState extends State<ValidCode> {
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
