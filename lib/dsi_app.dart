import 'package:flutter/material.dart';

import 'home_page.dart';
import 'dsi_page.dart';

class DsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'screen1',
      routes: {
        'screen1': (context) => HomePage(),
        'screen2': (context) => DSIPage(title: 'My First App - DSI/BSI/UFRPE')
      },
    );
  }
}
