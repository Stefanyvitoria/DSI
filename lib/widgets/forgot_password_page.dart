import 'package:flutter/material.dart';
import 'package:project_dsi/services/infraestrurura.dart';

class ConfirmEmail extends StatefulWidget {
  @override
  State<ConfirmEmail> createState() {
    return ConfirmEmailState();
  }
}

class ConfirmEmailState extends State<ConfirmEmail> {
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar senha'),
      ),
      body: ListView(
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
          Container(
            padding: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30,
            ),
            child: RaisedButton(
              onPressed: () {
                dsihelper.showAlert(
                    context: context,
                    title: 'Instruções Enviadas.',
                    message: 'Verifique seu endereço de E-mail.',
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushReplacementNamed('forgotpassword2');
                    });
              },
              child: Text(
                'Confirmar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Colors.green[300],
            ),
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
    );
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
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 25,
                right: 25,
              ),
              child: Center(
                child: Text(
                  'Insira o código recebido por e-mail:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
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
          Container(
            padding: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30,
            ),
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('forgotpassword3');
              },
              child: Text(
                'Verificar código',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.green[300],
            ),
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
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redefinir Senha'),
      ),
      body: ListView(
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
          Container(
            padding: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30,
            ),
            child: RaisedButton(
              onPressed: () {
                dsihelper.showAlert(
                    context: context,
                    title: 'Senha Atualizada.',
                    message: 'Senha Atualiza com sucesso.',
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/');
                    });
              },
              child: Text(
                'Redefinir senha',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green[300],
            ),
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
    );
  }
}
