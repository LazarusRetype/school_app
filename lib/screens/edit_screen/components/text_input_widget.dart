import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';

class CustomTextInput extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final int? maxLength;
  final String? initialValue;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formater;
  final String? Function(String?) valitation;

  const CustomTextInput({
    Key? key,
    required this.lable,
    required this.controller,
    this.inputType,
    this.maxLength,
    this.formater,
    this.initialValue,
    required this.valitation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: AppConsts.marginEdge,
          right: AppConsts.marginEdge,
          top: AppConsts.marginSmall),
      height: 115,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: valitation,
        keyboardType: inputType,
        inputFormatters: formater,
        initialValue: initialValue,
        controller: controller,
        maxLength: maxLength != 0 ? maxLength : null,
        cursorColor: AppColor.cursorColor,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: const TextStyle(color: AppColor.textColor),
          focusedBorder: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(),
          fillColor: AppColor.onBackgroundColor,
          filled: true,
        ),
      ),
    );
  }
}
