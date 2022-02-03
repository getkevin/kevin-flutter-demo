import 'package:flutter/material.dart';
import 'package:kevin_demo_app/presentation/core/text_styles.dart';

class KevinDemoTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;

  const KevinDemoTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0x1e000000),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
    );

    return TextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      style: textField,
      autocorrect: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
