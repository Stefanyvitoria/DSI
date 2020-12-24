import 'package:flutter/material.dart';

class App2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuDrawer(),
    );
  }
}

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('email@ufrpe.br'),
              accountName: Text('Name'),
              currentAccountPicture: Image(
                image: AssetImage('images/thug1.jpg'),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.home),
              leading: Icon(Icons.camera),
              title: Text('item 1'),
              onTap: () {
                print('clicou');
              },
            ),
            ListTile(
              trailing: Icon(Icons.account_circle),
              leading: Icon(Icons.account_box),
              title: Text('item 2'),
              onTap: () {
                print('clicou');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('PÁGINA INICIAL!'),
      ),
    );
  }
}
