import 'package:flutter/material.dart';

import 'login_page.dart';
import 'forgot_password_page1.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'register_personal_page.dart';

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
        'screenloginpage': (context) => LoginPage(),
        'screenhomepage': (context) => HomePage(),
        'screenforgotpassword1': (context) => ConfirmEmail(),
        'screenforgotpassword2': (context) => ValidCode(),
        'screenforgotpassword3': (context) => NewPassword(),
        'screenregisterpage': (context) => RegisterPage(),
        'screenregisterpersonalpage': (context) => RegisterPersonalPage(),
      },
    );
  }
}
