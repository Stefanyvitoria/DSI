import 'package:flutter/material.dart';
import 'package:project_dsi/services/constants.dart';
import 'package:project_dsi/services/database.dart';
import 'package:project_dsi/services/infraestrurura.dart';
import 'package:project_dsi/widgets/DSI_widgets.dart';

class Pessoa {
  var id;
  String cpf, nome, endereco;

  Pessoa({this.id, this.cpf, this.nome, this.endereco});
}

class ListPessoaPage extends StatefulWidget {
  @override
  _ListPessoaPageState createState() => _ListPessoaPageState();
}

class _ListPessoaPageState extends State<ListPessoaPage> {
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Pessoas',
      body: SafeArea(
        child: StreamBuilder<Object>(
            stream: DataBaseServicePessoa().listPessoa(), //*****
            builder: (context, snapshot) {
              List<Pessoa> pessoas = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: pessoas.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      DataBaseServicePessoa().removePessoa(pessoas[index].id);
                      dsihelper.showMessage(
                          context: context,
                          message: '${pessoas[index].nome} removido.');
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
                      title: Text(pessoas[index].nome),
                      subtitle: Text('${pessoas[index].endereco}'),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                            '/maintainpessoa',
                            arguments: pessoas[index]);
                      },
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

class MaintainPessoaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Pessoa pessoa = ModalRoute.of(context)
        .settings
        .arguments; //Recupera o argumento passado com a rota.
    return DsiScaffold(
      title: 'Pessoa',
      body: SingleChildScrollView(
        child: Form(
          key: UniqueKey(),
          child: Padding(
            padding: Constants.paddingMedium,
            child: Column(
              children: <Widget>[
                Wrap(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: (String value) {
                        return value.isEmpty ? 'Nome inválido.' : null;
                      },
                      initialValue: pessoa.nome,
                      onSaved: (newValue) => pessoa.nome = newValue,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'CPF'),
                      validator: (String value) {
                        return value.isEmpty ? 'CPF inválido.' : null;
                      },
                      initialValue: pessoa.cpf,
                      onSaved: (newValue) => pessoa.cpf = newValue,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Endereço'),
                      validator: (String value) {
                        return value.isEmpty ? 'Endereço Inválido.' : null;
                      },
                      initialValue: pessoa.endereco,
                      onSaved: (newValue) => pessoa.endereco = newValue,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text('Voltar'),
                          padding: EdgeInsets.all(5.0),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/listpessoa');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
