import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextField extends StatelessWidget {
  final int? initalValue;
  final TextEditingController controller;
  final VoidCallback function;
  const NumberTextField(
      {Key? key,
      required this.controller,
      required this.function,
      this.initalValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = (initalValue ?? 0).toString();

    return SizedBox(
      height: 50,
      width: 50,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))],
        controller: controller,
        autofocus: true,
        onChanged: (text) => function,
      ),
    );
  }
}
