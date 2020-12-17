import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  @override
  State<ForgotPage> createState() {
    return ForgotPageState();
  }
}

class ForgotPageState extends State<ForgotPage> {
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
