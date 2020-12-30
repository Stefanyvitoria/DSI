import 'package:flutter/material.dart';
import 'constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String email, senha;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        padding: EdgeInsets.only(
          top: 40,
          left: 30,
          right: 30,
          bottom: 5,
        ),
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image(
                image: Images.bsiLogo,
              ),
            ),
            Container(height: 20, width: 10),
            TextFormField(
              onChanged: (textemail) {
                email = textemail;
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
            Container(height: 20),
            TextFormField(
              onChanged: (textsenha) {
                senha = textsenha;
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
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('forgotpassword1');
                },
                child: Text(
                  'Esqueci minha senha.',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
            Container(height: 20),
            RaisedButton(
              onPressed: () {
                //Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/homepage');
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              autofocus: true,
              color: Colors.green[300],
            ),
            Container(height: 10),
            Container(
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/register');
                },
                child: Text(
                  'Cadastre-se',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'App desenvolvido por Stefany Vitória para a disciplina de'
                ' Desenvolvimento de Sistemas de Informação do BSI/UFRPE.',
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
