import 'package:flutter/material.dart';
import 'package:project_dsi/constants.dart';
import 'login_page.dart';
import 'forgot_password_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'register_personal_page.dart';
import 'pessoa.dart';

void main() {
  _initDB();
  runApp(DsiApp());
}

class DsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: _buidTheme(),
      initialRoute: '/',
      routes: _buidRoutes(context),
    );
  }

  ThemeData _buidTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity, //Densidade
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
        caption: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 18.0),
        bodyText2: TextStyle(fontSize: 16.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: Constants.paddingMedium, //espaço
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          )),
    );
  }

  _buidRoutes(context) {
    return {
      '/': (context) => LoginPage(),
      '/homepage': (context) => HomePage(),
      '/register': (context) => RegisterPage(),
      'forgotpassword1': (context) => ConfirmEmail(),
      'forgotpassword2': (context) => ValidCode(),
      'forgotpassword3': (context) => NewPassword(),
      '/homepage/account': (context) => RegisterPersonalPage(),
      '/listpessoa': (context) => ListPessoaPage(),
      'maintainpessoa': (context) => MaintainPessoaPage(),
    };
  }
}

void _initDB() {
  //A implementar.
}
