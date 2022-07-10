import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';

class NumberIndicator extends StatelessWidget {
  final double number;
  const NumberIndicator({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(right: 5),
      decoration: const BoxDecoration(
          color: AppColor.onBackgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppConsts.cornerRadius))),
      child: Center(
        child: Text("$number"),
      ),
    );
  }
}
