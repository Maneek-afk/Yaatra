import 'package:flutter/material.dart';
import 'package:bus/classes/Colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: ColorPicker.textColor),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const  TextStyle(color: ColorPicker.textColor),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
