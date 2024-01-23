import 'package:flutter/material.dart';

class textfeildwidget extends StatelessWidget {
  String hinttext;
  TextEditingController controller;
  TextInputType keybordtype;
  textfeildwidget(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.keybordtype});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: hinttext),
      controller: controller,
      keyboardType: keybordtype,
    );
  }
}
