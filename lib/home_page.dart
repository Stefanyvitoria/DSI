import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
        ),
        body: Container(
          child: Opacity(
            opacity: 0.5,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfff7ffe8),
                        Color(0xffc2ca94)
                      ], // Color(0xffc7ffba)
                      stops: [0.8, 1.0],
                      transform: GradientRotation(3.1415 / 2.03),
                    ),
                    image: DecorationImage(
                      image: AssetImage('images/logo/bsi.png'),
                    )),
              ),
            ),
          ),
        ));
  }
}
