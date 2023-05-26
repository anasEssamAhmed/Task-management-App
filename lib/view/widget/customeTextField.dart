import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String text;
  bool isSecure;
  bool enable;
  CustomTextField(this.text , this.controller, this.isSecure,this.enable);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: isSecure,
        enabled: enable,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
