import 'package:flutter/material.dart';
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
  ListPessoaPageState createState() => ListPessoaPageState();
}

class ListPessoaPageState extends State<ListPessoaPage> {
  List<Pessoa> _pessoas = pessoaControler.getAll();

  @override
  Widget build(BuildContext context) {
    return DsiScaffold();
  }
}
