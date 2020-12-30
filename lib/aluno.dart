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
    Aluno _aluno = _alunos[index];
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          alunoControler.remove(_aluno);
          _alunos.remove(index);
          dsihelper.showMessage(
            context: context,
            message: 'Aluno ${_aluno.nome} Removido.',
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
        title: Text(_aluno.nome),
        subtitle: Text('mat. ${_aluno.matricula}'),
        onTap: () {}, //a implementar *****
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
            keyboardType: TextInputType.number,
            onChanged: (textn) {},
            autofocus: false,
            decoration: InputDecoration(
              labelText: 'CPF',
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            onChanged: (textn) {},
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
          TextFormField(
            onChanged: (textn) {},
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
          TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (textn) {},
            autofocus: false,
            decoration: InputDecoration(
              labelText: 'Matrícula',
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
