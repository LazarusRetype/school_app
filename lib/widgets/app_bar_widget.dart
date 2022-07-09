import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';

class CustomeAppBar extends StatelessWidget {
  final Widget child;
  const CustomeAppBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConsts.appBarHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.mainColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor,
            spreadRadius: AppConsts.shadowSpread,
            blurRadius: AppConsts.shadowBlur,
            offset: Offset(AppConsts.shadowOffset, AppConsts.shadowOffset),
          )
        ],
      ),
      child: child,
    );
  }
}
