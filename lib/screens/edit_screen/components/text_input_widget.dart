import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';

class CustomTextInput extends StatefulWidget {
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
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.text = widget.initialValue ?? "";
  }

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
        validator: widget.valitation,
        keyboardType: widget.inputType,
        inputFormatters: widget.formater,
        controller: widget.controller,
        maxLength: widget.maxLength != 0 ? widget.maxLength : null,
        cursorColor: AppColor.cursorColor,
        decoration: InputDecoration(
          labelText: widget.lable,
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
