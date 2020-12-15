import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('DSI App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Clique para ir ao contador.',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed('screen2');
            },
            child: Text('Contador'),
            color: Colors.blue[100],
          )
        ],
      )),
    ));
  }
}
