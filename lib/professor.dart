import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_dsi/DSI_widgets.dart';
import 'package:project_dsi/infraestrurura.dart';

import 'pessoa.dart';

class Professor extends Pessoa {
  String turmas;

  Professor({this.turmas, cpf, nome, endereco})
      : super(cpf: cpf, endereco: endereco, nome: nome);
}

var professorControler = ProfessorControler();

class ProfessorControler {
  List<Professor> getAll() {
    return pessoaControler.getAll().whereType<Professor>().toList();
  }

  Professor save(professor) {
    return pessoaControler.save(professor);
  }

  bool remove(professor) {
    return pessoaControler.remove(professor);
  }
}

class ListProfessorPage extends StatefulWidget {
  @override
  _ListProfessorPageState createState() => _ListProfessorPageState();
}

class _ListProfessorPageState extends State<ListProfessorPage> {
  List<Professor> _professores = professorControler.getAll();

  @override
  Widget build(BuildContext contex) {
    return DsiScaffold(
      title: 'Professores',
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _professores.length,
        itemBuilder: _builListTileProfessor,
      ),
    );
  }

  Widget _builListTileProfessor(context, index) {
    Professor professor = _professores[index];
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          professorControler.remove(professor);
          _professores.removeAt(index);
          dsihelper.showMessage(
            context: context,
            message: 'Professor ${professor.nome} removido.',
          );
        });
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
        title: Text(professor.nome),
        subtitle: Text('turma: ${professor.turmas}'),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed('/maintainprofessor', arguments: professor);
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
        professorControler.save(professor);
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
            keyboardType: TextInputType.number,
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
