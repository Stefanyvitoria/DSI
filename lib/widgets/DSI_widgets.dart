import 'package:flutter/material.dart';
import 'package:project_dsi/services/infraestrurura.dart';
import 'package:project_dsi/services/constants.dart';

class DsiScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget floatActionButton;
  final bool showAppBar;

  DsiScaffold({
    @required this.body,
    this.title,
    this.floatActionButton,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawerMenu(context),
      body: this.body,
      floatingActionButton: this.floatActionButton,
    );
  }

  AppBar _buildAppBar(context) {
    if (!showAppBar) return null;
    return AppBar(
      title: title != null ? Text(title) : null,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/homepage/account');
          },
          icon: Icon(
            Icons.account_box,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            dsihelper.showAlert(
              title: 'Notificações.',
              message: 'Falta implementar.',
              context: context,
            );
          },
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        PopupMenuButton(
          icon: Icon(Icons.more_vert, color: Colors.white),
          onSelected: (value) => {
            if (value == 'sair')
              {Navigator.of(context).pushReplacementNamed('/')}
            else if (value == 'pref')
              {
                dsihelper.showAlert(
                  title: 'Preferências.',
                  message: 'Falta implementar',
                  context: context,
                )
              }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: Text('Preferências'),
              value: 'pref',
            ),
            PopupMenuItem(
              child: Text('Sair'),
              value: 'sair',
            )
          ],
        )
      ],
    );
  }

  Drawer _buildDrawerMenu(context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountEmail: Text('Stefany.vitoria@ufrpe.br'),
              accountName: Text('Stefany Izidio'),
              otherAccountsPictures: [
                Container(
                  child: Image(
                    alignment: Alignment.center,
                    image: Images.bsiLogoWhite,
                  ),
                ),
              ]),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/homepage'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Pessoas'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/listpessoa'),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Alunos'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/listaluno'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Professores'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/listprofessor'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
        ],
      ),
    );
  }
}

class DSIBasicFormPage extends StatefulWidget {
  final String title;
  final onSave;
  final Widget body;
  final hideButtons;
  final String isP;

  DSIBasicFormPage({
    @required this.title,
    this.onSave,
    this.body,
    this.hideButtons = false,
    this.isP = 'pessoa',
  });

  @override
  _DSIBasicFormPageState createState() => _DSIBasicFormPageState();
}

class _DSIBasicFormPageState extends State<DSIBasicFormPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: widget.title,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: Constants.paddingMedium,
            child: Column(
              children: <Widget>[
                widget.body,
                buildFormButtons('Salvar'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormButtons(txt) {
    if (widget.hideButtons) return null;

    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            child: Text(txt),
            onPressed: () {
              if (!formKey.currentState.validate()) return;
              setState(() {
                formKey.currentState.save();
              });
              widget.onSave.call();
            },
          ),
        ),
        FlatButton(
          child: Text('Cancelar'),
          padding: EdgeInsets.all(5.0),
          onPressed: () {
            if (widget.isP == 'pessoa') {
              Navigator.of(context).pushReplacementNamed('/listpessoa');
            } else if (widget.isP == 'aluno') {
              Navigator.of(context).pushReplacementNamed('/listaluno');
            } else if (widget.isP == 'professor') {
              Navigator.of(context).pushReplacementNamed('/listprofessor');
            }
          },
        )
      ],
    );
  }
}
