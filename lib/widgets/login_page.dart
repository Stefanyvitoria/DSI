import 'package:flutter/material.dart';
import 'package:project_dsi/services/constants.dart';

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
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(height: 20),
              TextFormField(
                onChanged: (value) {
                  senha = value;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed('forgotpassword1');
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
                  Navigator.of(context).pushReplacementNamed('/homepage');
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                color: Colors.green[200],
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
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
              ),
              //Spacer(),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  'App desenvolvido por Stefany Vitória para a disciplina de'
                  ' Desenvolvimento de Sistemas de Informação do BSI/UFRPE.',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
