import 'package:flutter/material.dart';
import 'package:project_dsi/services/infraestrurura.dart';
import 'package:project_dsi/widgets/DSI_widgets.dart';
import 'pessoa.dart';
import 'package:project_dsi/services/database.dart';
import 'package:project_dsi/services/loading.dart';

class Aluno extends Pessoa {
  String matricula;

  Aluno({cpf, nome, endereco, id, this.matricula})
      : super(cpf: cpf, nome: nome, endereco: endereco, id: id);
}

class ListAlunoPage extends StatefulWidget {
  @override
  _ListAlunoPageState createState() => _ListAlunoPageState();
}

class _ListAlunoPageState extends State<ListAlunoPage> {
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Alunos',
      body: SafeArea(
        child: StreamBuilder(
          stream: DataBaseServiceAluno().listAluno(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            List<Aluno> alunos = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: alunos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    DataBaseServiceAluno().removeAluno(alunos[index].id);
                    dsihelper.showMessage(
                      context: context,
                      message: 'Aluno ${alunos[index].nome} Removido.',
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
                    title: Text(alunos[index].nome),
                    subtitle: Text('mat. ${alunos[index].matricula}'),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          '/maintainaluno',
                          arguments: alunos[index]);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => _AddAluno()));
        },
      ),
    );
  }
}

class MaintainAlunoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Aluno aluno = ModalRoute.of(context).settings.arguments;
    if (aluno == null) aluno = Aluno();

    return DSIBasicFormPage(
      title: 'Aluno',
      onSave: () {
        DataBaseServiceAluno().updateAluno(aluno.id, aluno);
        Navigator.of(context).pushReplacementNamed('/listaluno');
      },
      isP: 'aluno',
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
            initialValue: aluno.nome,
            onSaved: (newValue) => aluno.nome = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'CPF'),
            validator: (String value) {
              return value.isEmpty ? 'CPF inválido.' : null;
            },
            initialValue: aluno.cpf,
            onSaved: (newValue) => aluno.cpf = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Endereço'),
            validator: (String value) {
              return value.isEmpty ? 'Endereço Inválido.' : null;
            },
            initialValue: aluno.endereco,
            onSaved: (newValue) => aluno.endereco = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Matrícula'),
            validator: (String value) {
              return value.isEmpty ? 'Matrícula inválida.' : null;
            },
            initialValue: aluno.matricula,
            onSaved: (newValue) => aluno.matricula = newValue,
          ),
        ],
      ),
    );
  }
}

class _AddAluno extends StatefulWidget {
  @override
  __AddAlunoState createState() => __AddAlunoState();
}

class __AddAlunoState extends State<_AddAluno> {
  Aluno aluno = Aluno();

  @override
  Widget build(context) {
    return DSIBasicFormPage(
      title: 'Aluno',
      onSave: () {
        DataBaseServiceAluno().createNewAluno(aluno);
        Navigator.of(context).pushReplacementNamed('/listaluno');
      },
      isP: 'aluno',
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
            onSaved: (newValue) => aluno.nome = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'CPF'),
            validator: (String value) {
              return value.isEmpty ? 'CPF inválido.' : null;
            },
            onSaved: (newValue) => aluno.cpf = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Endereço'),
            validator: (String value) {
              return value.isEmpty ? 'Endereço Inválido.' : null;
            },
            onSaved: (newValue) => aluno.endereco = newValue,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Matrícula'),
            validator: (String value) {
              return value.isEmpty ? 'Matrícula inválida.' : null;
            },
            onSaved: (newValue) => aluno.matricula = newValue,
          ),
        ],
      ),
    );
  }
}
