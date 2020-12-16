import 'package:flutter/material.dart';

import 'dsi_page.dart';
import 'login_page.dart';
import 'forgot_password_page1.dart';
import 'forgot_password_page2.dart';
import 'forgot_password_page3.dart';

class DsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSI-App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'screenloginpage',
      routes: {
        'screenloginpage': (context) => LoginPage(), //HomePage(),
        'screendsipage': (context) =>
            DSIPage(title: 'My First App - DSI/BSI/UFRPE'),
        'screenforgotpassword1': (context) => ForgotPage(),
        'screenforgotpassword2': (context) => ValidEmail(),
        'screenforgotpassword3': (context) => NewPassword(),
      },
    );
  }
}
