import 'package:flutter/material.dart';
import 'package:project_dsi/widgets/DSI_widgets.dart';

class RegisterPersonalPage extends StatefulWidget {
  @override
  State<RegisterPersonalPage> createState() {
    return RegisterPersonalPageState();
  }
}

class RegisterPersonalPageState extends State<RegisterPersonalPage> {
  String nome, sexo, dataDeNascimento, endereco, cpf, estadocivil;

  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Perfil',
      showAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
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
              onChanged: (value) {
                nome = value;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            Container(height: 20, width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  height: 65,
                  child: DropdownButton<String>(
                      hint: Text("Sexo"),
                      value: sexo,
                      onChanged: (value) {
                        setState(() {
                          sexo = value;
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
                Container(width: 10),
                Expanded(
                    child: TextFormField(
                  onChanged: (value) {
                    dataDeNascimento = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Data de nascimento:',
                  ),
                )),
              ],
            ),
            Container(height: 5, width: 10),
            TextFormField(
              onChanged: (value) {
                endereco = value;
              },
              decoration: InputDecoration(
                labelText: 'Endereço',
              ),
            ),
            Container(height: 20, width: 10),
            TextFormField(
                onChanged: (value) {
                  cpf = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CPF:',
                )),
            Container(height: 20, width: 10),
            TextFormField(
              onChanged: (value) {
                estadocivil = value;
              },
              decoration: InputDecoration(
                labelText: 'Estado civil',
              ),
            ),
            Container(height: 20, width: 10),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            FlatButton(
              child: Text('Cancelar'),
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
