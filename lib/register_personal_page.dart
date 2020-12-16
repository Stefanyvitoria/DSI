import 'package:flutter/material.dart';

class RegisterPersonalPage extends StatefulWidget {
  @override
  State<RegisterPersonalPage> createState() {
    return RegisterPersonalPageState();
  }
}

class RegisterPersonalPageState extends State<RegisterPersonalPage> {
  String email = '';
  String _sexo, dataDeNascimento, cep;

  // ignore: non_constant_identifier_names
  void Msg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastro Realizado.'),
          content: Text('Faça login com seu e-mail e senha.'),
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
        title: Text('Perfil'),
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
                  'Prencha os campos para criar seu perfil.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Container(height: 20, width: 10),
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 20, width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  height: 65,
                  child: DropdownButton<String>(
                      hint: Text(
                        "Sexo",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      value: _sexo,
                      onChanged: (changedValue) {
                        setState(() {
                          _sexo = changedValue;
                        });
                      },
                      items:
                          <String>['Masculino', 'Feminino'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList()),
                ),
                Container(height: 20, width: 10),
                new Flexible(
                    child: TextFormField(
                  onChanged: (text) {
                    dataDeNascimento = text;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Data de nascimento:',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ))
              ],
            ),
            Container(height: 5, width: 10),
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Endereço',
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 20, width: 10),
            new Flexible(
                child: TextFormField(
              onChanged: (text) {
                cep = text;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'CPF:',
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )),
            Container(height: 20, width: 10),
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Estado civil',
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 20, width: 10),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Salvar Perfil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
