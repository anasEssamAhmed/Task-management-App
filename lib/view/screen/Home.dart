import 'package:flutter/material.dart';
import 'package:to_do_app/view/responsive/Large%20Screen.dart';
import 'package:to_do_app/view/responsive/Small%20Screen.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 450
        ? largeScreen()
        : SmallScreen();
  }
}
