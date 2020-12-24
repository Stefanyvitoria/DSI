import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tela(),
    );
  }
}

class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  List images = ['image/eu.jpg', 'image/py.jpg'];
  int index = 0;
  List<MeuItemMenu> _itens = [
    MeuItemMenu(title: 'ste', icon: Icons.access_alarm),
    MeuItemMenu(title: 'python', icon: Icons.account_box),
  ];
  MeuItemMenu item;

  Row myAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Fotinha de Stefany'),
        RaisedButton(
          onPressed: () {
            setState(() {
              if (index == 0) {
                print('ste');
              } else {
                print('python');
              }
            });
          },
          color: Colors.white54,
          child: Text('print nome ft'),
        ),
      ],
    );
  }

  _select(MeuItemMenu item) {
    setState(() {
      if (index == 0 && item.title != 'ste') {
        index = 1;
      } else if (index == 1 && item.title != 'python') {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myAppBar(),
        actions: [
          PopupMenuButton(
            onSelected: _select,
            itemBuilder: ((BuildContext context) {
              return _itens.map((MeuItemMenu item) {
                return PopupMenuItem<MeuItemMenu>(
                  value: item,
                  child: Text(item.title),
                );
              }).toList();
            }),
          ),
        ],
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index]),
                ),
                color: Colors.blue[50],
              ),
              child: Column(
                children: [
                  Text(
                    'Escreve sobre a imagem, por que o texto está no single render do container',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 40.0),
                  ),
                  Container(
                    width: 70,
                    height: 50,
                    color: Colors.red,
                    child: Center(child: Text('index = $index')),
                  )
                ],
              ),
            ),
            Text(
                'Está fora porque o texto está no mult render do objeto de alinhamento "Aling".',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class MeuItemMenu {
  MeuItemMenu({this.title, this.icon});

  String title;
  IconData icon;
}
