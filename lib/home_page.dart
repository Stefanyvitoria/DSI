import 'package:flutter/material.dart';
import 'DSI_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Home',
      showAppBar: true,
      body: Container(),
    );
  }
}
