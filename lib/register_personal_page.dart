import 'package:flutter/material.dart';
import 'package:project_dsi/infraestrurura.dart';
import 'infraestrurura.dart';

class RegisterPersonalPage extends StatefulWidget {
  @override
  State<RegisterPersonalPage> createState() {
    return RegisterPersonalPageState();
  }
}

class RegisterPersonalPageState extends State<RegisterPersonalPage> {
  String nome, sexo, dataDeNascimento, enderco, cpf, estadocivil;

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
              onChanged: (textn) {
                nome = textn;
              },
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
                      value: sexo,
                      onChanged: (changedValue) {
                        setState(() {
                          sexo = changedValue;
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
                  onChanged: (textn) {
                    dataDeNascimento = textn;
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
              onChanged: (texten) {
                enderco = texten;
              },
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
              onChanged: (textcpf) {
                cpf = textcpf;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'CPF:',
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )),
            Container(height: 20, width: 10),
            TextFormField(
              onChanged: (textec) {
                estadocivil = textec;
              },
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
                print('ok');
                DSIHelper().showMessage(
                    title: 'Sucesso.',
                    context: context,
                    message: 'Perfil salvo com sucesso.',
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
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
