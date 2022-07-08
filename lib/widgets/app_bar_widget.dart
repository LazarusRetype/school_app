import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';

class CustomeAppBar extends StatelessWidget {
  final Widget child;
  const CustomeAppBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColor.mainColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: child,
    );
  }
}
