import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dsi_page.dart';

void main() {
  runApp(DsiApp());
}

class DsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'screen1',
      routes: {
        'screen1': (context) => HomePage(),
        'screen2': (context) => DSIPage(title: 'My First App - DSI/BSI/UFRPE')
      },
    );
  }
}
