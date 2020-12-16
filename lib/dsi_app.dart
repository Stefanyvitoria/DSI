import 'package:flutter/material.dart';

import 'login_page.dart';
import 'forgot_password_page1.dart';
import 'forgot_password_page2.dart';
import 'forgot_password_page3.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'dsi_page.dart';
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
        'screenforgotpassword1': (context) => ForgotPage(),
        'screenforgotpassword2': (context) => ValidEmail(),
        'screenforgotpassword3': (context) => NewPassword(),
        'screenregisterpage': (context) => RegisterPage(),
        'screenregisterpersonalpage': (context) => RegisterPersonalPage(),
        'screendsi': (context) =>
            DSIPage(title: 'My First App - DSI/BSI/UFRPE'), //HomePage1(),
      },
    );
  }
}
