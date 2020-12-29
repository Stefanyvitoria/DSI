import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'infraestrurura.dart';

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
      body: this.body,
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
}
