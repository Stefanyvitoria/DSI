import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  MyPopupItem selected_item = choices[0]; // default

  void _select(MyPopupItem item) {
    setState(() {
      selected_item = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Home',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).pushNamed('screenregisterpersonalpage');
              },
            )
          ],
        ),
        actions: [
          PopupMenuButton<MyPopupItem>(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print('On cancelled was called');
            },
            tooltip: 'This is tootip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((MyPopupItem choice) {
                return PopupMenuItem<MyPopupItem>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },)
        ],
      ),

      body:

      buildItem(),
    );
  }

  buildItem() {
    return Container(child: SelectedOption(choice: selected_item),);
  }
}


class SelectedOption extends StatelessWidget {
  MyPopupItem choice;
  SelectedOption({Key key, this.choice }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(choice.icon,
                size: 140.0,
                color: Colors.brown,),
          Text(choice.title,
          style: TextStyle(
          color: Colors.brown,
          fontSize: 30.0),)
        ]),
    ));
  }
}


class MyPopupItem {
  MyPopupItem({this.title, this.icon});

  String title;
  IconData icon;
}

List<MyPopupItem> choices = <MyPopupItem>[
  MyPopupItem(title: 'Account', icon: Icons.account_circle),
  MyPopupItem(title: 'phone', icon: Icons.phone),
  MyPopupItem(title: 'Email', icon: Icons.email),
  MyPopupItem(title: 'Refresh', icon: Icons.refresh),
];