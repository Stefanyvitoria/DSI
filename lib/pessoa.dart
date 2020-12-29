import 'package:flutter/material.dart';
import 'package:project_dsi/infraestrurura.dart';
import 'DSI_widgets.dart';

abstract class Pessoa {
  int id;
  String cpf, nome, endereco;

  Pessoa(id, cpf, nome, endereco) {
    this.id = id;
    this.cpf = cpf;
    this.nome = nome;
    this.endereco = endereco;
  }
}

var pessoaControler = PessoaControler();

class PessoaControler {
  var _nextId = 1;
  var _pessoas = <Pessoa>[];

  List<Pessoa> getAll() {
    return _pessoas;
  }

  Pessoa getByCPF(String cpf) {
    for (Pessoa p in _pessoas) {
      if (p.cpf == cpf) {
        return p;
      }
    }
    return null;
  }

  void _validDateOnSave(pessoa) {
    Pessoa p = getByCPF(pessoa.cpf);
    if (p != null && p.id != pessoa.id) {
      throw Exception('Já existe uma pessoa com o cpf: ${pessoa.cpf}');
    }
  }

  Pessoa save(pessoa) {
    _validDateOnSave(pessoa);

    if (pessoa.id == null) {
      //inserindo
      pessoa.id = _nextId++;
      _pessoas.add(pessoa);
    } else {
      //alterando
      var index = _pessoas.indexWhere((element) => element.id == pessoa.id);
      _pessoas.setRange(index, index + 1, [pessoa]);
    }
    return pessoa;
  }

  bool remove(pessoa) {
    bool result = false;
    var index = _pessoas.indexWhere((element) => element.id == pessoa.id);
    if (index != -1) {
      result = true;
      _pessoas.removeAt(index);
    }
    return result;
  }
}

class ListPessoaPage extends StatefulWidget {
  @override
  _ListPessoaPageState createState() => _ListPessoaPageState();
}

class _ListPessoaPageState extends State<ListPessoaPage> {
  List<Pessoa> _pessoasList = pessoaControler.getAll();

  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Pessoas',
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _pessoasList.length,
        itemBuilder: _builListTilePessoas,
      ),
    );
  }

  Widget _builListTilePessoas(context, index) {
    var pessoa = _pessoasList[index];

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          pessoaControler.remove(
              pessoa); //remove da listagem do escopo global (Sincronizado com a listagem de alunos).
          _pessoasList.remove(
              index); //remove da listagem do escopo local (Listagem de Pessoas).
          dsihelper.showMessage(
              context: context, message: '${pessoa.nome} removido.');
        });
      },
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white),
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: ListTile(
        title: Text(pessoa.nome),
        subtitle: Text('${pessoa.endereco}'),
        onTap: () {
          Navigator.of(context).pushNamed('maintainpassoa');
        },
      ),
    );
  }
}

class MaintainPessoaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Pessoa pessoa = ModalRoute.of(context).settings.arguments;

    return DSIBasicFormPage(
      title: 'Pessoa',
      onSave: () {
        pessoaControler.save(pessoa);
        Navigator.of(context).pushReplacementNamed('/listpessoa');
      },
      body: Wrap(
        children: [
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
              labelText: 'Endereço',
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
