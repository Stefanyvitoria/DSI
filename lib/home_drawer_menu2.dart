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
  int n = 1;
  List<Widget> listobjects = [Text('ok - 1')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Menu'),
        actions: [
          RaisedButton(
            onPressed: () {
              setState(() {
                n++;
                addListTile();
                print(n);
              });
              //criar novo objeto no listView
            },
            child: Text(
              'adicionar',
              style: TextStyle(fontSize: 15),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                n--;
                rmListTile(n);
                print(n);
              });
              //criar novo objeto no listView
            },
            child: Text(
              'remover',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
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
              trailing: Icon(Icons.home), //depois
              leading: Icon(Icons.camera), //antes
              title: Text('item 1'),
              onTap: () {
                print('clicou 1');
              },
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          direction: Axis.vertical,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: listobjects,
        ),
      ),
    );
  }

  addListTile() {
    print('add $n');
    listobjects.add(Text('ok - $n'));
  }

  rmListTile(ind) {
    print('rm $ind');
    listobjects.remove(listobjects[ind]);
  }
}
