import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  @override
  State<ForgotPage> createState() {
    return ForgotPageState();
  }
}

class ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recuperar senha'),
        ),
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Clique ',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Redefinir senha'),
                color: Colors.blue[100],
              )
            ],
          ),
        ]));
  }
}
