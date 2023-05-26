import 'package:flutter/material.dart';

class LargeScreenWidget extends StatelessWidget {
  PageController page;
  int numberPage;
  String text;
  LargeScreenWidget(this.page , this.numberPage , this.text);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          page.animateToPage(numberPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
        child: Text(text));
  }
}
