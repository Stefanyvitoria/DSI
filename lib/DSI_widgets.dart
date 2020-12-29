import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'infraestrurura.dart';
import 'constants.dart';

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
            DSIHelper().showMessage(
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
                DSIHelper().showMessage(
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
    //var themeData = Theme.of(context);

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountEmail: Text('Ste@ufrpe.br'),
              accountName: Text('Ste'),
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
              onTap: () => DSIHelper().showMessage(
                    title: 'Pessoas.',
                    message: 'A implementar',
                    context: context,
                  )
              //Navigator.of(context).pushReplacementNamed('/listprofessor'),
              ),
          ListTile(
              leading: Icon(Icons.book),
              title: Text('Alunos'),
              onTap: () => DSIHelper().showMessage(
                    title: 'Alunos',
                    message: 'A implementar.',
                    context: context,
                  )
              //Navigator.of(context).pushReplacementNamed('/listaluno'),
              ),
          ListTile(
              leading: Icon(Icons.school),
              title: Text('Professores'),
              onTap: () => DSIHelper().showMessage(
                    title: 'Professores.',
                    message: 'A implementar',
                    context: context,
                  )
              //Navigator.of(context).pushReplacementNamed('/listprofessor'),
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
