import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget MyTextField(
    {required TextEditingController controller,
    required String hintText,
    TextInputType inputType = TextInputType.text}) {
  return TextField(
    controller: controller,
    keyboardType: inputType,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: hintText,
        fillColor: Colors.white70),
  );
}
