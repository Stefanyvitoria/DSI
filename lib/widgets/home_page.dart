import 'package:flutter/material.dart';
import 'package:project_dsi/widgets/DSI_widgets.dart';
import 'package:project_dsi/services/constants.dart';
import 'dart:math';

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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Constants.colorGreenBSI3,
              Constants.colorGreenBSI2,
            ],
            stops: [0.8, 1.0],
            transform: GradientRotation(pi / 2),
          ),
          image: DecorationImage(
            image: Images.bsiLogo,
          ),
        ),
      ),
    );
  }
}
