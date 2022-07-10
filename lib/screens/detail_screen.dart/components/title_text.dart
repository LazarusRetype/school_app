import 'package:flutter/material.dart';
import 'package:school_app/constants/app_consts.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppConsts.marginEdge, top: AppConsts.marginBig),
      child: Text(text),
    );
  }
}
