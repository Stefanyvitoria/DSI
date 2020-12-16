import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
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
            Container(height: 20, width: 10),
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
          ],
        ),
      ),
    );
  }
}
