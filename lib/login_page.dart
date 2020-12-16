import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 30,
          right: 30,
        ),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image.asset('images/logo/bsi.png'),
            ),
            Container(height: 20, width: 10),
            TextFormField(
              //cursorColor: Colors.green,
              autofocus: true,
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
                //color: Colors.green[50],
                onPressed: () {},
                child: Text(
                  'Esqueci minha senha.',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
            Container(height: 20),
            RaisedButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              autofocus: true,
              color: Colors.green[300],
            ),
            Container(height: 10),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                //color: Colors.green[50],
                onPressed: () {},
                child: Text(
                  'Cadastre-se',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 150),
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
