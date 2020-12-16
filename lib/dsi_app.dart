import 'package:flutter/material.dart';

import 'home_page.dart';
import 'dsi_page.dart';
import 'login_page.dart';
import 'forgot_password_page.dart';

class DsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSI-STE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'screen1',
      routes: {
        'screen1': (context) => LoginPage(), //HomePage(),
        'screen2': (context) => DSIPage(title: 'My First App - DSI/BSI/UFRPE'),
        'screenforgot': (context) => ForgotPage(),
      },
    );
  }
}
