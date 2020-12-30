import 'package:flutter/material.dart';
import 'package:project_dsi/infraestrurura.dart';
import 'DSI_widgets.dart';
import 'pessoa.dart';

class Aluno extends Pessoa {
  String matricula;

  Aluno({cpf, nome, endereco, this.matricula})
      : super(cpf: cpf, nome: nome, endereco: endereco);
}

var alunoControler = AlunoControler();

class AlunoControler {
  List<Aluno> getAll() {
    return pessoaControler.getAll().whereType<Aluno>().toList();
  }

  Aluno save(aluno) {
    return pessoaControler.save(aluno);
  }

  bool remove(aluno) {
    return pessoaControler.remove(aluno);
  }
}

class ListAlunoPage extends StatefulWidget {
  @override
  _ListAlunoPageState createState() => _ListAlunoPageState();
}

class _ListAlunoPageState extends State<ListAlunoPage> {
  List<Aluno> _alunos = alunoControler.getAll();

  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Alunos',
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _alunos.length,
        itemBuilder: _buildListTileAluno,
      ),
    );
  }

  Widget _buildListTileAluno(context, index) {
    Aluno aluno = _alunos[index];
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          alunoControler.remove(aluno);
          _alunos.remove(index);
          dsihelper.showMessage(
            context: context,
            message: 'Aluno ${aluno.nome} Removido.',
          );
        });
      },
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
      child: ListTile(
        title: Text(aluno.nome),
        subtitle: Text('mat. ${aluno.matricula}'),
        onTap: () {
          Navigator.of(context).pushNamed('/maintainaluno', arguments: aluno);
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
        alunoControler.save(aluno);
        Navigator.of(context).pushReplacementNamed('/listaluno');
      },
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Matrícula'),
            validator: (String value) {
              return value.isEmpty ? 'Matrícula inválida.' : null;
            },
            initialValue: aluno.cpf,
            onSaved: (newValue) => aluno.matricula = newValue,
          ),
        ],
      ),
    );
  }
}
