import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_dsi/services/database.dart';
import 'package:project_dsi/services/loading.dart';
import 'package:project_dsi/widgets/DSI_widgets.dart';
import 'package:project_dsi/services/infraestrurura.dart';

import 'pessoa.dart';

class Professor extends Pessoa {
  String turmas;

  Professor({this.turmas, cpf, nome, id, endereco})
      : super(cpf: cpf, endereco: endereco, nome: nome);
}

class ListProfessorPage extends StatefulWidget {
  @override
  _ListProfessorPageState createState() => _ListProfessorPageState();
}

class _ListProfessorPageState extends State<ListProfessorPage> {
  //List<Professor> _professores = professorControler.getAll();

  @override
  Widget build(BuildContext contex) {
    return DsiScaffold(
      title: 'Professores',
      body: SafeArea(
        child: StreamBuilder(
            stream: DataBaseServiceProfessor().listProfessor(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }
              List<Professor> professores = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: professores.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      DataBaseServiceProfessor()
                          .removeProfessor(professores[index].id);
                      dsihelper.showMessage(
                        context: context,
                        message:
                            'Professor ${professores[index].nome} removido.',
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.delete, color: Colors.white),
                          Icon(Icons.delete, color: Colors.white),
                        ],
                      ),
                    ),
                    child: ListTile(
                      title: Text(professores[index].nome),
                      subtitle: Text('turma: ${professores[index].turmas}'),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                            '/maintainprofessor',
                            arguments: professores[index]);
                      },
                    ),
                  );
                },
              );
            }),
      ),
      floatActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => _AddProfessor()));
        },
      ),
    );
  }
}

class MaintainProfessor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Professor professor = ModalRoute.of(context).settings.arguments;

    return DSIBasicFormPage(
      title: 'Professor',
      onSave: () {
        DataBaseServiceProfessor().updateProfessor(professor.id, professor);
        Navigator.of(context).pushReplacementNamed('/listprofessor');
      },
      isP: 'professor',
      body: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8.0,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Nome'),
            validator: (String value) {
              return value.isEmpty ? 'Nome inválido.' : null;
            },
            initialValue: professor.nome,
            onSaved: (newValue) => professor.nome = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'CPF'),
            validator: (String value) {
              return value.isEmpty ? 'CPF inválido.' : null;
            },
            initialValue: professor.cpf,
            onSaved: (newValue) => professor.cpf = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Endereço'),
            validator: (String value) {
              return value.isEmpty ? 'Endereço Inválido.' : null;
            },
            initialValue: professor.endereco,
            onSaved: (newValue) => professor.endereco = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Turma'),
            validator: (String value) {
              return value.isEmpty ? 'Turma inválida.' : null;
            },
            initialValue: professor.turmas,
            onSaved: (newValue) => professor.turmas = newValue,
          )
        ],
      ),
    );
  }
}

class _AddProfessor extends StatefulWidget {
  @override
  __AddProfessorState createState() => __AddProfessorState();
}

class __AddProfessorState extends State<_AddProfessor> {
  Professor professor = Professor();

  @override
  Widget build(BuildContext context) {
    return DSIBasicFormPage(
      title: 'Professor',
      onSave: () {
        DataBaseServiceProfessor().createNewProfessor(professor);
        Navigator.of(context).pushReplacementNamed('/listprofessor');
      },
      isP: 'professor',
      body: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8.0,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Nome'),
            validator: (String value) {
              return value.isEmpty ? 'Nome inválido.' : null;
            },
            onSaved: (newValue) => professor.nome = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'CPF'),
            validator: (String value) {
              return value.isEmpty ? 'CPF inválido.' : null;
            },
            onSaved: (newValue) => professor.cpf = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Endereço'),
            validator: (String value) {
              return value.isEmpty ? 'Endereço Inválido.' : null;
            },
            onSaved: (newValue) => professor.endereco = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Turma'),
            validator: (String value) {
              return value.isEmpty ? 'Turma inválida.' : null;
            },
            onSaved: (newValue) => professor.turmas = newValue,
          )
        ],
      ),
    );
  }
}
