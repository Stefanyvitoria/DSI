import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaWrap(),
    );
  }
}

class TelaWrap extends StatefulWidget {
  @override
  _TelaWrapState createState() => _TelaWrapState();
}

class _TelaWrapState extends State<TelaWrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Center(
          child: Container(
            color: Colors.pink[50],
            height: 300,
            width: 200,
            child: Wrap(
              spacing: 10.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                Text('texto'),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
